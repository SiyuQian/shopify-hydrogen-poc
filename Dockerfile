FROM node:16.15.0-alpine3.14 as build

# Stage 0 - Build frontend assets
WORKDIR /app

RUN npm install pm2 -g

COPY package*.json ./
RUN yarn
COPY . .
RUN yarn build
EXPOSE 8080
CMD ["pm2-runtime", "dist/server/index.js"]