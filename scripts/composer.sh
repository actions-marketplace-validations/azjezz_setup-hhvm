#!/bin/sh

# From https://getcomposer.org/doc/faqs/how-to-install-composer-programmatically.md

EXPECTED_CHECKSUM="$(wget -q -O - https://composer.github.io/installer.sig)"
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
ACTUAL_CHECKSUM="$(php -r "echo hash_file('sha384', 'composer-setup.php');")"

if [ "$EXPECTED_CHECKSUM" != "$ACTUAL_CHECKSUM" ]; then
  >&2 echo 'ERROR: Invalid installer checksum'
  rm composer-setup.php
  exit 1
fi

exit php composer-setup.php --install-dir=/usr/local/bin --filename=composer && rm composer-setup.php
