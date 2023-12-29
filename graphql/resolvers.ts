import prisma from "../lib/prisma";

export const resolvers = {
    Query: {
      users : async (_parent, _args, context) => await prisma.user.findMany({
        include: {
          addresses: true,
        },
      }),
    },
  }