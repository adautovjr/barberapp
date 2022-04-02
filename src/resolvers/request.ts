import { prisma } from '../index'
import { RequestMutationInput } from '@type/mutations'

const RequestResolver = {
  Query: {
    allRequests: () => prisma.request.findMany()
  },
  Mutation: {
    createRequest: (_: any, data: RequestMutationInput, { prisma }: any) => prisma.request.create({
      data
    })
  }
}

export default RequestResolver