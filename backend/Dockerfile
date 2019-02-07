FROM node

ENV WORKDIR /app


RUN mkdir "$WORKDIR"
WORKDIR $WORKDIR

COPY . $WORKDIR

RUN yarn install

CMD ["npm", "run", "start"]

