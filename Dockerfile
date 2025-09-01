# Multi-stage build for production

# Backend builder
FROM node:20 as backend-builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN ./node_modules/.bin/tsc

# Backend runtime
FROM node:20 as backend
WORKDIR /app
COPY --from=backend-builder /app/dist /app
COPY --from=backend-builder /app/package*.json /app/
RUN npm install --only=production
USER node
EXPOSE 3031
CMD ["node", "server/server.js"]

# Frontend builder
FROM node:20 as frontend-builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN ./node_modules/.bin/webpack --mode production

# Frontend runtime
FROM nginx:alpine as frontend
COPY --from=frontend-builder /app/build /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf
EXPOSE 8081
