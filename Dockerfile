# build stage
FROM node:18-alpine as build
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build
## các bạn có thể dùng yarn install .... tuỳ nhu cầu nhé

# deploy stage
FROM nginx:1.27-alpine
COPY --from=build /app/dist /usr/share/nginx/html
CMD ["nginx", "-g", "daemon off;"]
