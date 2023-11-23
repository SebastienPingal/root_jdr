/*
  Warnings:

  - You are about to drop the `campagne` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Personnage" DROP CONSTRAINT "Personnage_campagneId_fkey";

-- DropTable
DROP TABLE "campagne";

-- CreateTable
CREATE TABLE "Campagne" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,

    CONSTRAINT "Campagne_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Personnage" ADD CONSTRAINT "Personnage_campagneId_fkey" FOREIGN KEY ("campagneId") REFERENCES "Campagne"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
