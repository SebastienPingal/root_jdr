-- CreateTable
CREATE TABLE "Personnage" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "espece" TEXT NOT NULL,
    "details" TEXT NOT NULL,
    "blessures" INTEGER NOT NULL DEFAULT 0,
    "blessures_max" INTEGER NOT NULL DEFAULT 4,
    "epuisement" INTEGER NOT NULL DEFAULT 0,
    "epuisement_max" INTEGER NOT NULL DEFAULT 4,
    "denuement" INTEGER NOT NULL DEFAULT 0,
    "denuement_max" INTEGER NOT NULL DEFAULT 4,
    "porte" INTEGER NOT NULL DEFAULT 0,
    "charge" INTEGER NOT NULL DEFAULT 4,
    "charge_max" INTEGER NOT NULL DEFAULT 8,
    "livretId" INTEGER NOT NULL,
    "natureId" INTEGER NOT NULL,

    CONSTRAINT "Personnage_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Reputation" (
    "id" SERIAL NOT NULL,
    "personnageId" INTEGER NOT NULL,
    "factionId" INTEGER NOT NULL,
    "value" INTEGER NOT NULL,
    "prestige" INTEGER NOT NULL,
    "defaveur" INTEGER NOT NULL,

    CONSTRAINT "Reputation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Equipement" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "valeur" INTEGER NOT NULL,
    "personnageId" INTEGER NOT NULL,
    "charges" INTEGER NOT NULL,
    "usure" INTEGER NOT NULL,
    "usure_max" INTEGER NOT NULL DEFAULT 1,

    CONSTRAINT "Equipement_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_MotivationToPersonnage" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_ManoeuvreToPersonnage" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_AspectToEquipement" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_Manoeuvre_martialeToPersonnage" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_PersonnageToRelation" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_PersonnageToPersonnage" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_PersonnageToTour_de_crapule" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_EquipementToPortee" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_EquipementToManoeuvre_martiale" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_MotivationToPersonnage_AB_unique" ON "_MotivationToPersonnage"("A", "B");

-- CreateIndex
CREATE INDEX "_MotivationToPersonnage_B_index" ON "_MotivationToPersonnage"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_ManoeuvreToPersonnage_AB_unique" ON "_ManoeuvreToPersonnage"("A", "B");

-- CreateIndex
CREATE INDEX "_ManoeuvreToPersonnage_B_index" ON "_ManoeuvreToPersonnage"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_AspectToEquipement_AB_unique" ON "_AspectToEquipement"("A", "B");

-- CreateIndex
CREATE INDEX "_AspectToEquipement_B_index" ON "_AspectToEquipement"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Manoeuvre_martialeToPersonnage_AB_unique" ON "_Manoeuvre_martialeToPersonnage"("A", "B");

-- CreateIndex
CREATE INDEX "_Manoeuvre_martialeToPersonnage_B_index" ON "_Manoeuvre_martialeToPersonnage"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_PersonnageToRelation_AB_unique" ON "_PersonnageToRelation"("A", "B");

-- CreateIndex
CREATE INDEX "_PersonnageToRelation_B_index" ON "_PersonnageToRelation"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_PersonnageToPersonnage_AB_unique" ON "_PersonnageToPersonnage"("A", "B");

-- CreateIndex
CREATE INDEX "_PersonnageToPersonnage_B_index" ON "_PersonnageToPersonnage"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_PersonnageToTour_de_crapule_AB_unique" ON "_PersonnageToTour_de_crapule"("A", "B");

-- CreateIndex
CREATE INDEX "_PersonnageToTour_de_crapule_B_index" ON "_PersonnageToTour_de_crapule"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_EquipementToPortee_AB_unique" ON "_EquipementToPortee"("A", "B");

-- CreateIndex
CREATE INDEX "_EquipementToPortee_B_index" ON "_EquipementToPortee"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_EquipementToManoeuvre_martiale_AB_unique" ON "_EquipementToManoeuvre_martiale"("A", "B");

-- CreateIndex
CREATE INDEX "_EquipementToManoeuvre_martiale_B_index" ON "_EquipementToManoeuvre_martiale"("B");

-- AddForeignKey
ALTER TABLE "Personnage" ADD CONSTRAINT "Personnage_livretId_fkey" FOREIGN KEY ("livretId") REFERENCES "Livret"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Personnage" ADD CONSTRAINT "Personnage_natureId_fkey" FOREIGN KEY ("natureId") REFERENCES "Nature"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Reputation" ADD CONSTRAINT "Reputation_personnageId_fkey" FOREIGN KEY ("personnageId") REFERENCES "Personnage"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Reputation" ADD CONSTRAINT "Reputation_factionId_fkey" FOREIGN KEY ("factionId") REFERENCES "Faction"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Equipement" ADD CONSTRAINT "Equipement_personnageId_fkey" FOREIGN KEY ("personnageId") REFERENCES "Personnage"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_MotivationToPersonnage" ADD CONSTRAINT "_MotivationToPersonnage_A_fkey" FOREIGN KEY ("A") REFERENCES "Motivation"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_MotivationToPersonnage" ADD CONSTRAINT "_MotivationToPersonnage_B_fkey" FOREIGN KEY ("B") REFERENCES "Personnage"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ManoeuvreToPersonnage" ADD CONSTRAINT "_ManoeuvreToPersonnage_A_fkey" FOREIGN KEY ("A") REFERENCES "Manoeuvre"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ManoeuvreToPersonnage" ADD CONSTRAINT "_ManoeuvreToPersonnage_B_fkey" FOREIGN KEY ("B") REFERENCES "Personnage"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_AspectToEquipement" ADD CONSTRAINT "_AspectToEquipement_A_fkey" FOREIGN KEY ("A") REFERENCES "Aspect"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_AspectToEquipement" ADD CONSTRAINT "_AspectToEquipement_B_fkey" FOREIGN KEY ("B") REFERENCES "Equipement"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Manoeuvre_martialeToPersonnage" ADD CONSTRAINT "_Manoeuvre_martialeToPersonnage_A_fkey" FOREIGN KEY ("A") REFERENCES "Manoeuvre_martiale"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Manoeuvre_martialeToPersonnage" ADD CONSTRAINT "_Manoeuvre_martialeToPersonnage_B_fkey" FOREIGN KEY ("B") REFERENCES "Personnage"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_PersonnageToRelation" ADD CONSTRAINT "_PersonnageToRelation_A_fkey" FOREIGN KEY ("A") REFERENCES "Personnage"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_PersonnageToRelation" ADD CONSTRAINT "_PersonnageToRelation_B_fkey" FOREIGN KEY ("B") REFERENCES "Relation"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_PersonnageToPersonnage" ADD CONSTRAINT "_PersonnageToPersonnage_A_fkey" FOREIGN KEY ("A") REFERENCES "Personnage"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_PersonnageToPersonnage" ADD CONSTRAINT "_PersonnageToPersonnage_B_fkey" FOREIGN KEY ("B") REFERENCES "Personnage"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_PersonnageToTour_de_crapule" ADD CONSTRAINT "_PersonnageToTour_de_crapule_A_fkey" FOREIGN KEY ("A") REFERENCES "Personnage"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_PersonnageToTour_de_crapule" ADD CONSTRAINT "_PersonnageToTour_de_crapule_B_fkey" FOREIGN KEY ("B") REFERENCES "Tour_de_crapule"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_EquipementToPortee" ADD CONSTRAINT "_EquipementToPortee_A_fkey" FOREIGN KEY ("A") REFERENCES "Equipement"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_EquipementToPortee" ADD CONSTRAINT "_EquipementToPortee_B_fkey" FOREIGN KEY ("B") REFERENCES "Portee"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_EquipementToManoeuvre_martiale" ADD CONSTRAINT "_EquipementToManoeuvre_martiale_A_fkey" FOREIGN KEY ("A") REFERENCES "Equipement"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_EquipementToManoeuvre_martiale" ADD CONSTRAINT "_EquipementToManoeuvre_martiale_B_fkey" FOREIGN KEY ("B") REFERENCES "Manoeuvre_martiale"("id") ON DELETE CASCADE ON UPDATE CASCADE;
