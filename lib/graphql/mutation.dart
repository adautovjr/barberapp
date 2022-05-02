String createServiceMutation = """
  mutation createService (
    \$name: String!
    \$price: Float!
    \$duration: Int!
  ) {
    createService(
      name: \$name
      price: \$price
      duration: \$duration
    ) {
      id
      name
      price
      duration
      createdAt
    }
  }
""";

String createUserMutation = """
  mutation createUser (
    \$name: String!
    \$email: String!
    \$phone: String!
    \$role: Role!
  ) {
    createUser(
      name: \$name
      email: \$email
      phone: \$phone
      role: \$role
    ) {
      id
      role
      name
      email
      phone
    }
  }
""";

String createRequestMutation = """
  mutation createRequest (
    \$serviceId: String!
    \$barberId: String!
    \$clientId: String!
    \$price: Float!
    \$date: String!
  ) {
    createRequest(
      \$serviceId: String!
      \$barberId: String!
      \$clientId: String!
      \$price: Float!
      \$date: String!
    ) {
      id
      service {
        id
        name
        price
        duration
      }
      barber {
        id
        name
        email
        phone
      }
      client {
        id
        name
        email
        phone
      }
      price
      date
    }
  }
""";
