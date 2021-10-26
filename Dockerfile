FROM php:7.4-apache

ENV TZ=Europe/Madrid
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get upgrade -y && \
    apt-get install libc-client-dev libkrb5-dev -y && \
    rm -r /var/lib/apt/lists/*

RUN docker-php-ext-install mysqli && \
    docker-php-ext-enable mysqli

RUN docker-php-ext-configure imap --with-kerberos --with-imap-ssl && \
    docker-php-ext-install imap && \
    docker-php-ext-enable imap

RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
COPY conf.d/* $PHP_INI_DIR/conf.d/
