const { PrismaClient } = require('@prisma/client')
const prisma = new PrismaClient()

async function main() {
  const names = [
    { name: "Aigrefin" },
    { name: "Arbitre" },
    { name: "Aventurier" },
    { name: "Bricoleur" },
    { name: "Forestier" },
    { name: "Ronin" },
    { name: "Trafiquant" },
    { name: "Vaurien" },
    { name: "Voleur" },
    { name: "Champion" },
    { name: "Chroniqueur" },
    { name: "Exilé" },
    { name: "Ambassadeur" },
    { name: "Hérétique" },
    { name: "Pirate" },
    { name: "Prince" },
    { name: "Conteur" },
    { name: "Pillard" },
    { name: "Explorateur" }
  ];

  for (let name of names) {
    await prisma.livret.create({
      data: name
    })
  }
}

main()
  .catch(e => {
    throw e
  })
  .finally(async () => {
    await prisma.$disconnect()
  })
