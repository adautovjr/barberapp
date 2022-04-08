String getServicesQuery = """
  query {
    allServices {
      id
      name
      price
      duration
    }
  }
""";

String getUsersQuery = """
  query {
    allUsers {
      id
      name
    }
  }
""";

String getRequestsQuery = """
  query {
    allRequests {
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
