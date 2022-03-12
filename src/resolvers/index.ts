import UserResolver from '@resolvers/user'
import ServiceResolver from '@resolvers/service'
import RequestResolver from '@resolvers/request'

const resolvers = [
  UserResolver,
  ServiceResolver,
  RequestResolver
] 
export default resolvers