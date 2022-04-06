import express from 'express'
import { graphqlHTTP } from 'express-graphql'
import { makeExecutableSchema } from '@graphql-tools/schema'
import { loadSchemaSync } from '@graphql-tools/load'
import { GraphQLFileLoader } from '@graphql-tools/graphql-file-loader'
import { PrismaClient } from '@prisma/client'
import resolvers from '@resolvers/index'
import { join } from 'path'
import cors from 'cors'

const schema = loadSchemaSync(join(__dirname, 'config/schema.graphql'), {
  loaders: [new GraphQLFileLoader()]
})

export const executableSchema = makeExecutableSchema({
  resolvers,
  typeDefs: schema,
})

export const prisma = new PrismaClient()
const app = express()

app.use(cors())

app.use('/graphql', graphqlHTTP({
  schema: executableSchema,
  graphiql: true,
  context: {
    prisma,
  }
}));

app.listen(3000)
