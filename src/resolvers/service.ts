import { prisma } from '../index'
import { ServicesByBarberQuery } from '@type/queries'
import { ServiceMutationInput } from '@type/mutations'

const ServiceResolver = {
  Query: {
    allServices: () => prisma.service.findMany(),
    servicesByBarber: (_: any, query: ServicesByBarberQuery) => prisma.service.findMany({
      where: {
        barbers: {
          some: {
            id: query.barberId as number
          }
        }
      }
    })
  },
  Mutation: {
    createService: (_: any, data: ServiceMutationInput, { prisma }: any) => { 
      const { id, barbers, requests, ...service } = data
      
      return prisma.service.create({
        data: {
          ...service,
          barbers: {
            connect: data.barbers?.map(id => { id })
          },
          requests: {
            connect: data.requests?.map(id => { id })
          }
        }
      })
    },
    updateService: (_: any, data: ServiceMutationInput, { prisma }: any) => {
      const { id, barbers, requests, ...service } = data
      console.log("🚀 ~ file: service.ts ~ line 37 ~ data.barbers", data.barbers)
      console.log("🚀 ~ file: service.ts ~ line 27 ~ data.barbers?.map(id => { id })", data.barbers?.map(id => { id }))
      
      return prisma.service.update({
        where: {
          id: data.id as number
        },
        data: {
          ...service,
          barbers: {
            connect: data.barbers?.map(id => { id })
          },
          requests: {
            connect: data.requests?.map(id => { id })
          }
        }
      })
  }}
}

export default ServiceResolver