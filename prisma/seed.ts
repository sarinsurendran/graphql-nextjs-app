import { PrismaClient } from '@prisma/client';
import { addresses } from '../data/addresses';

const prisma = new PrismaClient();

async function main() {
  await prisma.user.create({
    data: {
      firstName: 'sarin',
      lastName: 'surendran',
      email: 'test@gmail.com',
    },
  });

  await prisma.address.createMany({
    data: addresses,
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