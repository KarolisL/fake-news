FROM node as builder

ENV WORKDIR /app

RUN mkdir "$WORKDIR"
WORKDIR $WORKDIR

COPY package.json $WORKDIR/package.json
RUN yarn install

COPY . $WORKDIR
RUN yarn build

FROM nginx

ENV WORKDIR /app

COPY nginx/nginx.conf /etc/nginx/nginx.conf

COPY --from=builder $WORKDIR/build /usr/share/nginx/html/

RUN find /usr/share/nginx/html -type f -exec chmod 644 {} \;
RUN find /usr/share/nginx/html -type d -exec chmod 755 {} \;


