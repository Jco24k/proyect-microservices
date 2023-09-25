FROM node:16-alpine


WORKDIR /usr/src

COPY package*.json ./

RUN npm i -g @nestjs/cli
RUN npm install -g pm2

COPY . /usr/src/

RUN npm install --only=production
RUN npm run build
EXPOSE 3000


ENTRYPOINT [ "npm", "run" ]
CMD ["start"]