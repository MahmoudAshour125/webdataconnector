FROM node:12.18.1

RUN apt-get -y update

WORKDIR /app

COPY package.json /app/package.json
RUN npm cache clean --force
RUN npm install --production

COPY . /app

RUN chown -R node /app

EXPOSE 8888

CMD ["npm","start"]

USER node