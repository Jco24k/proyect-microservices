FROM node:16-alpine


WORKDIR /usr/src

COPY package*.json ./

RUN npm i -g @nestjs/cli
RUN npm install --only=production
RUN npm install -g pm2

COPY . /usr/src/

EXPOSE 3000

RUN npm run build

ENTRYPOINT [ "pm2","start" ]
CMD ["ecosystem.config.js"]