#!/bin/bash

VOLUME_HOME="/var/lib/mysql"

sed -ri -e "s/^upload_max_filesize.*/upload_max_filesize = ${PHP_UPLOAD_MAX_FILESIZE}/" \
    -e "s/^post_max_size.*/post_max_size = ${PHP_POST_MAX_SIZE}/" /etc/php/7.0/apache2/php.ini # Path updated by A. Datta
sed -ri -e "s/^bind-address.*/bind-address\t\t= 	0\.0\.0\.0/" /etc/mysql/mysql.conf.d/mysqld.cnf # Line added by A. Datta
if [[ ! -d $VOLUME_HOME/mysql ]]; then
    echo "=> An empty or uninitialized MySQL volume is detected in $VOLUME_HOME"
    echo "=> Installing MySQL ..."
    # mysql_install_db > /dev/null 2>&1 Removed by A. Datta
    /usr/sbin/mysqld --initialize-insecure > /dev/null 2>&1 # Line added by A. Datta
    echo "=> Done!"  
    /create_mysql_admin_user.sh
else
    echo "=> Using an existing volume of MySQL"
fi

exec supervisord -n
