import { prisma } from '../index'
import { UserMutationInput } from '@type/mutations'

const UserResolver = {
  Query: {
    allUsers: () => prisma.user.findMany()
  },
  Mutation: {
    createUser: (_: any, data: UserMutationInput, { prisma }: any) => prisma.user.create({
      data
    })
  }
}

export default UserResolver