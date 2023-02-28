FROM node:16-alpine 
WORKDIR /app
COPY . .
ENV PATH /app/node_modules/.bin:$PATH
ENV NODE_ENV development
RUN npm ci
EXPOSE 3000
CMD [ "npm", "start" ]