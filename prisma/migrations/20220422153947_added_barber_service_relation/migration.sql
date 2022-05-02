-- CreateTable
CREATE TABLE "_servicesAsBarber" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_servicesAsBarber_AB_unique" ON "_servicesAsBarber"("A", "B");

-- CreateIndex
CREATE INDEX "_servicesAsBarber_B_index" ON "_servicesAsBarber"("B");

-- AddForeignKey
ALTER TABLE "_servicesAsBarber" ADD FOREIGN KEY ("A") REFERENCES "Service"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_servicesAsBarber" ADD FOREIGN KEY ("B") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
