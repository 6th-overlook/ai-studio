FROM node:latest-alpine as builder
WORKDIR /home/app
COPY . .
RUN npm install
RUN npm run build


FROM nginx:alpine
WORKDIR /home/app
COPY --from=builder build .
EXPOSE 3000 80
ENTRYPOINT ["nginx", "-g", "daemon off;"]


