/*
  Warnings:

  - You are about to drop the `course` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "batch" DROP CONSTRAINT "batch_workoutId_fkey";

-- DropTable
DROP TABLE "course";

-- CreateTable
CREATE TABLE "workout" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "workout_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "workout_name_key" ON "workout"("name");

-- AddForeignKey
ALTER TABLE "batch" ADD CONSTRAINT "batch_workoutId_fkey" FOREIGN KEY ("workoutId") REFERENCES "workout"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
