String getServicesQuery = """
  query {
    services {
      id
      name
      price
      duration
    }
  }
""";

String getUsersQuery = """
  query {
    users {
      id
      name
    }
  }
""";

String getRequestsQuery = """
  query {
    requests {
      id
      service {
        name
      }
      barber {
        name
      }
      price
    }
  }
""";

String findFirstUserQuery = """
  query findFirst (
    \$filter: UserWhereInput!
  ) {
    findFirstUser(where: \$filter) {
      id
      name
      email
      role
      phone
    }
  }
""";