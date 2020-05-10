FROM php:7.4-cli-alpine

RUN set -eux; \
    apk add --no-cache git openssh-client

RUN docker-php-ext-install sysvsem

RUN addgroup -g 1000 dandelion; \
    adduser -u 1000 -G dandelion -s /bin/sh -D dandelion

WORKDIR /home/dandelion

USER dandelion
