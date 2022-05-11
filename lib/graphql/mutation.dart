String createServiceMutation = """
  mutation createService (
    \$data: ServiceCreateInput!
  ) {
    createService(
      data: \$data
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
  mutation createUser (\$data: UserCreateInput!) {
    createUser(
      data: \$data
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
    \$data: RequestCreateInput!
  ) {
    createRequest(
      data: \$data
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
