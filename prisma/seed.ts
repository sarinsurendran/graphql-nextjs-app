import { PrismaClient } from '@prisma/client';
import { addresses } from '../data/addresses';

const prisma = new PrismaClient();

async function main() {
  const user1 = await prisma.user.create({
    data: {
      firstName: 'sarin',
      lastName: 'surendran',
      email: 'sarin@gmail.com',
      addresses: {
        create: [
          {city: 'kannur', state : 'kerala' , country : 'India' },
          {city: 'kochi', state : 'kerala' , country : 'India' },
        ],
      },
    },
  });

  const user2 = await prisma.user.create({
    data: {
      firstName: 'sayooj',
      lastName: 'surendran',
      email: 'sayooj@gmail.com',
    },
  });


  const user3 = await prisma.user.create({
    data: {
      firstName: 'anoop',
      lastName: 'sasi',
      email: 'anoop@yahoo.com',
      addresses: {
        create: [
          {city: 'kannur', state : 'kerala' , country : 'India' },
          {city: 'kochi', state : 'kerala' , country : 'India' },
          {city: 'bglr', state : 'krnd' , country : 'India' },
        ],
      },
    },
  });
}

main()
  .catch(e => {
    console.error(e)
    process.exit(1)
  })
  .finally(async () => {
    await prisma.$disconnect()
  })