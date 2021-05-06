#!bin/bash

source /etc/apache2/envvars

if [ ! -z "${MOODLE_POST_MAX_SIZE}" ]
then
  sed -i '/post_max_size/c\post_max_size = '$MOODLE_POST_MAX_SIZE /etc/php/7.4/apache2/php.ini
fi

if [ ! -z "${MOODLE_UPLOAD_MAX_FILESIZE}" ]
then
  sed -i '/upload_max_filesize/c\upload_max_filesize = '$MOODLE_UPLOAD_MAX_FILESIZE /etc/php/7.4/apache2/php.ini
fi

exec apache2 -D FOREGROUND