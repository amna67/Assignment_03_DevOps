# ---------- Build Stage ----------
FROM node:18-bullseye AS app-build-stage

WORKDIR /app

# Install build dependencies for node-gyp
RUN apt-get update && \
    apt-get install -y python3 make g++ && \
    rm -rf /var/lib/apt/lists/*

COPY package*.json ./
RUN npm install

COPY . .

RUN npx parcel build "./src/index.html" \
    --dist-dir "./dist" \
    --public-url "./" \
    --no-cache

# ---------- Deploy Stage ----------
FROM nginx:alpine AS deploy-stage

COPY --from=app-build-stage /app/dist /usr/share/nginx/html

EXPOSE 80
