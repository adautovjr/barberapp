import express from 'express'
import { DEFAULT_VARIABLE } from '@config/index'

const app = express()

app.get('/', (request, response) => {
  console.log(DEFAULT_VARIABLE)
  return response.json({ message: 'Hello world' })
})

app.listen(3000)
