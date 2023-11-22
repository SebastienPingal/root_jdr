-- CreateTable
CREATE TABLE "_LivretToMotivation" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_LivretToNature" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_LivretToManoeuvre" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_LivretToRelation" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_LivretToTour_de_crapule" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_LivretToManoeuvre_martiale" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_LivretToMotivation_AB_unique" ON "_LivretToMotivation"("A", "B");

-- CreateIndex
CREATE INDEX "_LivretToMotivation_B_index" ON "_LivretToMotivation"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_LivretToNature_AB_unique" ON "_LivretToNature"("A", "B");

-- CreateIndex
CREATE INDEX "_LivretToNature_B_index" ON "_LivretToNature"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_LivretToManoeuvre_AB_unique" ON "_LivretToManoeuvre"("A", "B");

-- CreateIndex
CREATE INDEX "_LivretToManoeuvre_B_index" ON "_LivretToManoeuvre"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_LivretToRelation_AB_unique" ON "_LivretToRelation"("A", "B");

-- CreateIndex
CREATE INDEX "_LivretToRelation_B_index" ON "_LivretToRelation"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_LivretToTour_de_crapule_AB_unique" ON "_LivretToTour_de_crapule"("A", "B");

-- CreateIndex
CREATE INDEX "_LivretToTour_de_crapule_B_index" ON "_LivretToTour_de_crapule"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_LivretToManoeuvre_martiale_AB_unique" ON "_LivretToManoeuvre_martiale"("A", "B");

-- CreateIndex
CREATE INDEX "_LivretToManoeuvre_martiale_B_index" ON "_LivretToManoeuvre_martiale"("B");

-- AddForeignKey
ALTER TABLE "_LivretToMotivation" ADD CONSTRAINT "_LivretToMotivation_A_fkey" FOREIGN KEY ("A") REFERENCES "Livret"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_LivretToMotivation" ADD CONSTRAINT "_LivretToMotivation_B_fkey" FOREIGN KEY ("B") REFERENCES "Motivation"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_LivretToNature" ADD CONSTRAINT "_LivretToNature_A_fkey" FOREIGN KEY ("A") REFERENCES "Livret"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_LivretToNature" ADD CONSTRAINT "_LivretToNature_B_fkey" FOREIGN KEY ("B") REFERENCES "Nature"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_LivretToManoeuvre" ADD CONSTRAINT "_LivretToManoeuvre_A_fkey" FOREIGN KEY ("A") REFERENCES "Livret"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_LivretToManoeuvre" ADD CONSTRAINT "_LivretToManoeuvre_B_fkey" FOREIGN KEY ("B") REFERENCES "Manoeuvre"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_LivretToRelation" ADD CONSTRAINT "_LivretToRelation_A_fkey" FOREIGN KEY ("A") REFERENCES "Livret"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_LivretToRelation" ADD CONSTRAINT "_LivretToRelation_B_fkey" FOREIGN KEY ("B") REFERENCES "Relation"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_LivretToTour_de_crapule" ADD CONSTRAINT "_LivretToTour_de_crapule_A_fkey" FOREIGN KEY ("A") REFERENCES "Livret"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_LivretToTour_de_crapule" ADD CONSTRAINT "_LivretToTour_de_crapule_B_fkey" FOREIGN KEY ("B") REFERENCES "Tour_de_crapule"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_LivretToManoeuvre_martiale" ADD CONSTRAINT "_LivretToManoeuvre_martiale_A_fkey" FOREIGN KEY ("A") REFERENCES "Livret"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_LivretToManoeuvre_martiale" ADD CONSTRAINT "_LivretToManoeuvre_martiale_B_fkey" FOREIGN KEY ("B") REFERENCES "Manoeuvre_martiale"("id") ON DELETE CASCADE ON UPDATE CASCADE;
