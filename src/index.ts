import express from 'express'
import { graphqlHTTP } from 'express-graphql'
import 'reflect-metadata'
import { PrismaClient } from '@prisma/client'
import { resolvers } from './prisma/generated/type-graphql/index'
import path from "path";
import cors from 'cors'
import { buildSchema } from 'type-graphql'

export const prisma = new PrismaClient()

async function main () {
  const schema = await buildSchema({
    resolvers: [...resolvers],
    emitSchemaFile: path.resolve(__dirname, "./src/prisma/schema.graphql"),
    validate: false,
  });
  
  const app = express()
  
  app.use(cors())
  
  app.use('/graphql', graphqlHTTP({
    schema,
    graphiql: true,
    context: {
      prisma,
    }
  }));
  const port = process.env.PORT || 3000
  console.log("🚀 ~ Running on port: ", port)
  app.listen(port)
}

main().catch(console.error)