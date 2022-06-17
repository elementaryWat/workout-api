-- DropForeignKey
ALTER TABLE "exercise" DROP CONSTRAINT "exercise_categoryId_fkey";

-- DropForeignKey
ALTER TABLE "exercise" DROP CONSTRAINT "exercise_setId_fkey";

-- AlterTable
ALTER TABLE "exercise" ALTER COLUMN "categoryId" DROP NOT NULL,
ALTER COLUMN "setId" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "exercise" ADD CONSTRAINT "exercise_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "category"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "exercise" ADD CONSTRAINT "exercise_setId_fkey" FOREIGN KEY ("setId") REFERENCES "set"("id") ON DELETE SET NULL ON UPDATE CASCADE;
