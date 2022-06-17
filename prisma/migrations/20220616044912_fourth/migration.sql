/*
  Warnings:

  - Made the column `categoryId` on table `exercise` required. This step will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE "exercise" DROP CONSTRAINT "exercise_categoryId_fkey";

-- AlterTable
ALTER TABLE "exercise" ALTER COLUMN "categoryId" SET NOT NULL;

-- AddForeignKey
ALTER TABLE "exercise" ADD CONSTRAINT "exercise_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "category"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
