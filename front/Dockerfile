FROM node:20.18.2-alpine AS build

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build

CMD ["sh", "-c", "echo 'Use docker cp or volumes to access /app/dist'"]
