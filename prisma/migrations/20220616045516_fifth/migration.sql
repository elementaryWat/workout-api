-- DropForeignKey
ALTER TABLE "exercise" DROP CONSTRAINT "exercise_categoryId_fkey";

-- AlterTable
ALTER TABLE "exercise" ALTER COLUMN "categoryId" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "exercise" ADD CONSTRAINT "exercise_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "category"("id") ON DELETE SET NULL ON UPDATE CASCADE;
