FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Run phase, FROM terminates the previous phase
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html