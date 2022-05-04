#!/bin/sh

git clone git@github.com:adautovjr/barberapp.git barber_flutter/
git clone git@github.com:adautovjr/barberapp.git barber_backend/
cd barber_backend/
git checkout stag/backend
npm install
docker-compose up -d
npx prisma migrate
cd ../barber_flutter/
git checkout stag/mobile
flutter pub get