FROM node


RUN mkdir /frodo
WORKDIR /frodo

COPY . /frodo

RUN yarn install

CMD ["npm", "run", "start"]
