FROM php:8.0-apache

RUN apt-get update && \
    apt-get install libc-client-dev libkrb5-dev libldap2-dev libzip-dev \
        zlib1g-dev libicu-dev libpng-dev -y

RUN docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
    && docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu

RUN pecl install apcu

RUN docker-php-ext-install mysqli imap ldap zip intl gd

RUN docker-php-ext-enable mysqli imap ldap zip intl gd opcache apcu

RUN pecl clear-cache

RUN apt-get purge libc-client-dev libkrb5-dev libldap2-dev libzip-dev \
        zlib1g-dev libicu-dev libpng-dev -y \
    && apt-get clean \
    && rm -r /var/lib/apt/lists/*

RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

COPY conf.d/* $PHP_INI_DIR/conf.d/
COPY start.sh /usr/local/bin/

CMD ["start.sh"]
