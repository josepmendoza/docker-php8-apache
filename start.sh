#!/bin/bash

TIMEZONE=${TZ:-UTC}

ln -snf /usr/share/zoneinfo/$TIMEZONE /etc/localtime \
    && echo $TIMEZONE > /etc/timezone \
    && echo "date.timezone = $TIMEZONE;" > "$PHP_INI_DIR/conf.d/var_date_timezone.ini"

apache2-foreground
