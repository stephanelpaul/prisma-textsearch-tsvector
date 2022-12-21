-- CreateExtension
CREATE EXTENSION IF NOT EXISTS "pg_trgm";

-- CreateTable
CREATE TABLE "users" (
    "id" SERIAL NOT NULL,
    "firstName" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,
    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

ALTER TABLE "users" ADD COLUMN "textSearch" TSVECTOR
  GENERATED ALWAYS AS
    (setweight(to_tsvector('english', coalesce("lastName", '')), 'A') ||
      setweight(to_tsvector('english', coalesce("firstName", '')), 'B'))
  STORED;

-- CreateIndex
CREATE INDEX "users_textSearch_idx" ON "users" USING GIN ("textSearch");
