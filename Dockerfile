FROM node

RUN mkdir /my-precious
WORKDIR /my-precious

COPY . /my-precious

CMD ["npm", "run", "start"]
