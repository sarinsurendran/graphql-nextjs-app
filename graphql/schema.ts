import { gql } from 'apollo-server-micro';

export const typeDefs = gql `
    type User {
      id: ID
      firstName: String
      lastName: String
      email: String
      addresses: [Address!]
    }

    type Address {
      id: ID
      city: String
      state: String
      country: String
    }

  type Query {
    users: [User]!
  }
`;