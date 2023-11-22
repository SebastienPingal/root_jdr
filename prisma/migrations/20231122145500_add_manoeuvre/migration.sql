-- CreateTable
CREATE TABLE "Manoeuvre" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,

    CONSTRAINT "Manoeuvre_pkey" PRIMARY KEY ("id")
);
