const typeDefs = `
  enum Role {
    ADMIN
    BARBER
    GUEST
  }
  type User {
    id: ID!
    role: Role!
    name: String!
    email: String
    phone: String
    requestsAsBarber: [Request]
    requestsAsClient: [Request]
    createdAt: String
    updatedAt: String
  }
  type Service {
    id: ID!
    name: String!
    price: Float!
    duration: Int!
    Requests: [Request]
    createdAt: String
    updatedAt: String
  }
  type Request {
    id: ID!
    service: [Service]
    barber: [User]
    client: [User]
    price: Float!
    date: String!
    createdAt: String
    updatedAt: String
  }
  type Query {
    allUsers: [User]
    allServices: [Service]
    allRequests: [Request]
  }
  type Mutation {
    createUser(
      name: String!
      email: String!
      phone: String!
      role: Role!
    ): User
    createService(
      name: String!
      price: Float!
      duration: Int!
    ): Service
    createRequest(
      serviceId: String!
      barberId: String!
      clientId: String!
      price: Float!
      date: String!
    ): Request
  }
`;

export default typeDefs