FROM node:17.9.0-alpine3.14
WORKDIR /build
COPY package.json /build
COPY package-lock.json /build
RUN npm ci --only=production && npm cache clean --force
RUN npx prisma generate
COPY . /build
RUN npm run build
CMD npm start
EXPOSE 8081