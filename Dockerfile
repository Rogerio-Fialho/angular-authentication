FROM node:10 AS builder

ADD ["package.json", "package-lock.json", "/sources/"]
WORKDIR /sources
RUN npm ci
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder ./sources/dist/angular-authentication ./usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
