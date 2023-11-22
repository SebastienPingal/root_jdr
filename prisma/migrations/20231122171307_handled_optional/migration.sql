-- DropForeignKey
ALTER TABLE "Equipement" DROP CONSTRAINT "Equipement_personnageId_fkey";

-- AlterTable
ALTER TABLE "Equipement" ALTER COLUMN "personnageId" DROP NOT NULL;

-- AlterTable
ALTER TABLE "Personnage" ALTER COLUMN "details" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "Equipement" ADD CONSTRAINT "Equipement_personnageId_fkey" FOREIGN KEY ("personnageId") REFERENCES "Personnage"("id") ON DELETE SET NULL ON UPDATE CASCADE;
