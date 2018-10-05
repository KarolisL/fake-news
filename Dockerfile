FROM node as builder

RUN mkdir /my-precious
WORKDIR /my-precious

COPY ./package.json /my-precious/package.json
RUN yarn install

COPY . /my-precious
RUN yarn build

FROM nginx

COPY nginx/nginx.conf /etc/nginx/nginx.conf

COPY --from=builder /my-precious/build /usr/share/nginx/html/

RUN find /usr/share/nginx/html -type f -exec chmod 644 {} \;
RUN find /usr/share/nginx/html -type d -exec chmod 755 {} \;
