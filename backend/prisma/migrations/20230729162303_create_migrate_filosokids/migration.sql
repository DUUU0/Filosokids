-- CreateTable
CREATE TABLE "users" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "nickname" TEXT NOT NULL,
    "is_admin" BOOLEAN NOT NULL,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "phases" (
    "id" TEXT NOT NULL,
    "number" INTEGER NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "phases_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "questions" (
    "id" TEXT NOT NULL,
    "text_if_correct" TEXT NOT NULL,
    "text_if_incorrect" TEXT NOT NULL,
    "number" TEXT NOT NULL,
    "avatar" TEXT NOT NULL,
    "image_upper_right" TEXT NOT NULL,
    "image_bottom_right" TEXT NOT NULL,
    "image_bottom_left" TEXT NOT NULL,
    "phase_id" TEXT NOT NULL,

    CONSTRAINT "questions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User_has_Questions" (
    "user_id" TEXT NOT NULL,
    "question_id" TEXT NOT NULL,

    CONSTRAINT "User_has_Questions_pkey" PRIMARY KEY ("user_id","question_id")
);

-- CreateTable
CREATE TABLE "alternativies" (
    "id" TEXT NOT NULL,
    "letter" TEXT NOT NULL,
    "text" TEXT NOT NULL,
    "true_or_false" BOOLEAN NOT NULL,
    "question_id" TEXT NOT NULL,

    CONSTRAINT "alternativies_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "achievements" (
    "id" TEXT NOT NULL,
    "phase_id" TEXT NOT NULL,

    CONSTRAINT "achievements_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User_has_Achievements" (
    "user_id" TEXT NOT NULL,
    "achievement_id" TEXT NOT NULL,

    CONSTRAINT "User_has_Achievements_pkey" PRIMARY KEY ("user_id","achievement_id")
);

-- CreateTable
CREATE TABLE "forms" (
    "id" TEXT NOT NULL,
    "text" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,

    CONSTRAINT "forms_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "users_nickname_key" ON "users"("nickname");

-- CreateIndex
CREATE UNIQUE INDEX "phases_number_key" ON "phases"("number");

-- CreateIndex
CREATE UNIQUE INDEX "questions_number_key" ON "questions"("number");

-- AddForeignKey
ALTER TABLE "questions" ADD CONSTRAINT "questions_phase_id_fkey" FOREIGN KEY ("phase_id") REFERENCES "phases"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User_has_Questions" ADD CONSTRAINT "User_has_Questions_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User_has_Questions" ADD CONSTRAINT "User_has_Questions_question_id_fkey" FOREIGN KEY ("question_id") REFERENCES "questions"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "alternativies" ADD CONSTRAINT "alternativies_question_id_fkey" FOREIGN KEY ("question_id") REFERENCES "questions"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "achievements" ADD CONSTRAINT "achievements_phase_id_fkey" FOREIGN KEY ("phase_id") REFERENCES "phases"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User_has_Achievements" ADD CONSTRAINT "User_has_Achievements_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User_has_Achievements" ADD CONSTRAINT "User_has_Achievements_achievement_id_fkey" FOREIGN KEY ("achievement_id") REFERENCES "achievements"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "forms" ADD CONSTRAINT "forms_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
