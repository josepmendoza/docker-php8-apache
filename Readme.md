# PHP APACHE docker Image
It's only a php-apache official build with extensions added, configuration tweaks and php.ini-production enabled.
## Extensions added
 - mysqli
 - imap
 - ldap
 - zip
 - intl
 - gd
 - opcache
 - apcu
## Configuration tweaks
 - upload_max_filesize = 16M
 - post_max_size = 16M
## Environment
 - TZ: Timezone string (defaults to UTC).
