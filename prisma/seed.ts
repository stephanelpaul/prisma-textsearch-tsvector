import { PrismaClient } from '@prisma/client'
const prisma = new PrismaClient()

async function main() {}

main()
    .then(async () => {
        await prisma.user.create({
            data: {
                firstName: 'alice',
                lastName: 'fairy'
            }
        })
    })
    .catch(async (e) => {
        console.error(e)
        await prisma.$disconnect()
        process.exit()
    })