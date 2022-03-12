import { prisma } from '../index'
import { ServiceMutationInput } from '@type/mutations'

const ServiceResolver = {
  Query: {
    allServices: () => prisma.service.findMany()
  },
  Mutation: {
    createService: (_: any, data: ServiceMutationInput, { prisma }: any) => prisma.service.create({
      data
    })
  }
}

export default ServiceResolver