FROM node:16-alpine
RUN apk --no-cache add curl 
WORKDIR /app
RUN curl -f https://get.pnpm.io/v6.16.js | node - add --global pnpm
COPY . .
ENV NODE_ENV development
ENV CHOKIDAR_USEPOLLING=true
ENV WATCHPACK_POLLING=true
RUN pnpm install
EXPOSE 3000
CMD [ "pnpm", "start" ]