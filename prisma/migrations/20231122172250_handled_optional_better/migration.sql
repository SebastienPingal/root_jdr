-- DropForeignKey
ALTER TABLE "Personnage" DROP CONSTRAINT "Personnage_livretId_fkey";

-- DropForeignKey
ALTER TABLE "Personnage" DROP CONSTRAINT "Personnage_natureId_fkey";

-- AlterTable
ALTER TABLE "Personnage" ALTER COLUMN "name" DROP NOT NULL,
ALTER COLUMN "espece" DROP NOT NULL,
ALTER COLUMN "livretId" DROP NOT NULL,
ALTER COLUMN "natureId" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "Personnage" ADD CONSTRAINT "Personnage_livretId_fkey" FOREIGN KEY ("livretId") REFERENCES "Livret"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Personnage" ADD CONSTRAINT "Personnage_natureId_fkey" FOREIGN KEY ("natureId") REFERENCES "Nature"("id") ON DELETE SET NULL ON UPDATE CASCADE;
