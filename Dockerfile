FROM node:10.14

ADD ["package.json", "package-lock.json", "/sources/"]
WORKDIR /sources
RUN npm ci

ADD ./ /sources

RUN npm run build

FROM docker.totvs.io/thf/proxy
COPY --from=0 /sources/dist /sources

EXPOSE 4200

CMD ["nginx", "-g", "daemon off;"]
