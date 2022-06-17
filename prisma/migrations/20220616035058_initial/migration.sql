-- CreateTable
CREATE TABLE "category" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,

    CONSTRAINT "category_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "exercise" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "url" VARCHAR(500),
    "categoryId" INTEGER NOT NULL,
    "setId" INTEGER NOT NULL,

    CONSTRAINT "exercise_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "set" (
    "id" SERIAL NOT NULL,
    "reps" INTEGER,
    "time" INTEGER,
    "weight" INTEGER,
    "rpe" INTEGER,
    "batchId" INTEGER NOT NULL,

    CONSTRAINT "set_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "batch" (
    "id" SERIAL NOT NULL,
    "workoutId" INTEGER NOT NULL,

    CONSTRAINT "batch_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "course" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "course_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "category_name_key" ON "category"("name");

-- CreateIndex
CREATE UNIQUE INDEX "exercise_name_key" ON "exercise"("name");

-- CreateIndex
CREATE UNIQUE INDEX "exercise_setId_key" ON "exercise"("setId");

-- CreateIndex
CREATE UNIQUE INDEX "course_name_key" ON "course"("name");

-- AddForeignKey
ALTER TABLE "exercise" ADD CONSTRAINT "exercise_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "category"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "exercise" ADD CONSTRAINT "exercise_setId_fkey" FOREIGN KEY ("setId") REFERENCES "set"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "set" ADD CONSTRAINT "set_batchId_fkey" FOREIGN KEY ("batchId") REFERENCES "batch"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "batch" ADD CONSTRAINT "batch_workoutId_fkey" FOREIGN KEY ("workoutId") REFERENCES "course"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
