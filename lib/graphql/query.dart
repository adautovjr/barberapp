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
