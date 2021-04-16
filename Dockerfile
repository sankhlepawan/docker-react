
# build phase to build code
FROM node:alpine as builder

WORKDIR /usr/app

COPY ./package.json ./

RUN npm install

COPY ./ ./

RUN npm run build


# running above build in nginx
FROM nginx:alpine
COPY --from=builder /usr/app/build /usr/share/nginx/html