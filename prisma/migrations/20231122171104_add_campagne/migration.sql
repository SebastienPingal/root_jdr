/*
  Warnings:

  - Added the required column `campagneId` to the `Personnage` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Personnage" ADD COLUMN     "campagneId" INTEGER NOT NULL;

-- CreateTable
CREATE TABLE "campagne" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,

    CONSTRAINT "campagne_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Personnage" ADD CONSTRAINT "Personnage_campagneId_fkey" FOREIGN KEY ("campagneId") REFERENCES "campagne"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
