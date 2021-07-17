import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()

// A `main` function so that you can use async/await
async function main() {
  // ... you will write your Prisma Client queries here

  await prisma.courier.upsert({
    create: {
      id: "Asd",
      locationLat: 32,
      locationLng: 23,
    },
    update: {
      connection: "asd"
    },
    where: {
      id: "Asd"
    }
  })


  prisma.courier.findFirst({
    where: {
      id: ""
    },
    select: {
      id: true,
      locationLat: true,

      orders: true
    }
  })


}

main()
  .catch(e => {
    throw e
  })
  .finally(async () => {
    await prisma.$disconnect()
  })
