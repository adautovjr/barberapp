import express from 'express'
import { graphqlHTTP } from 'express-graphql'
import { makeExecutableSchema } from '@graphql-tools/schema'
import { PrismaClient } from '@prisma/client'
import resolvers from '@resolvers/index'
import typeDefs from '@type/index'

export const schema = makeExecutableSchema({
  resolvers,
  typeDefs,
})

export const prisma = new PrismaClient()
const app = express()

app.use('/graphql', graphqlHTTP({
  schema,
  graphiql: true,
  context: {
    prisma,
  }
}));

app.listen(3000)
