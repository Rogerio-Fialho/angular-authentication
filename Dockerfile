# FROM node:11.6.0 AS builder

# ADD ["package.json", "package-lock.json", "/sources/"]
# WORKDIR /sources
# RUN npm ci
# COPY . .
# RUN npm run build

# FROM nginx:1.14.1-alpine

# COPY nginx/default.conf /etc/nginx/conf.d/
# COPY --from=builder /sources/ /sources
# # COPY --from=builder /sources/dist/angular-authentication /usr/share/nginx/html

# EXPOSE 80

# CMD ["nginx", "-g", "daemon off;"]


FROM node:12.2.0

# # install chrome for protractor tests
# RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
# RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
# RUN apt-get update && apt-get install -yq google-chrome-stable

# set working directory
WORKDIR /sources

# add `/app/node_modules/.bin` to $PATH
ENV PATH /sources/node_modules/.bin:$PATH

# install and cache app dependencies
COPY package.json /sources/package.json
RUN npm install
RUN npm install -g @angular/cli@8.0.0

# add app
COPY . /sources

EXPOSE 4200

# start app
CMD ng serve --host 0.0.0.0
