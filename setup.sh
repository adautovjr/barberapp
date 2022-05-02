#!/bin/sh

git clone git@github.com:adautovjr/barberapp.git barber_flutter/
git clone git@github.com:adautovjr/barberapp.git barber_backend/
cd barber_backend/
npm install
# Insert Docker setup commands here
npx prisma migrate
cd ../barber_flutter/
flutter pub get