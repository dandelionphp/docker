FROM dandelionphp/php:7.4-cli-alpine

USER root

RUN set -eux; \
    apk add --no-cache --virtual .phpize_deps $PHPIZE_DEPS; \
    pecl install xdebug; \
    docker-php-ext-enable xdebug; \
    apk del .phpize_deps

RUN set -eux; \
    apk add --no-cache make zip unzip

RUN set -eux; \
    wget -O /tmp/installer https://getcomposer.org/installer; \
    php /tmp/installer --no-ansi --install-dir=/usr/bin --filename=composer; \
    composer --ansi --version --no-interaction; \
    rm -f /tmp/installer

RUN set -eux; \
    wget -O /usr/bin/box https://github.com/humbug/box/releases/latest/download/box.phar; \
    chmod +x /usr/bin/box; \
    box --ansi --version --no-interaction

USER dandelion

RUN set -eux; \
    composer global require hirak/prestissimo

