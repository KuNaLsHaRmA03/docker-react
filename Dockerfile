FROM node:16-alpine AS builder

WORKDIR /app
COPY ./package.json ./
RUN npm install
COPY ./ ./

RUN npm run build
# /app/build <--- folder

FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html

#we don't need to write command to run it, it will be taken care by nginx