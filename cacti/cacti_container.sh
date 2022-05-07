#!/bin/bash
# update on 09/24/2021.Add the spine support

if [ -e setup_waiting ];then
# Give spine the proper permissions
	chmod u+s /usr/bin/spine
# Set the host timezone
	ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
# Set database
	sed -i '/\[mysqld\]/a character-set-server=utf8mb4 \
collation-server=utf8mb4_unicode_ci' /etc/my.cnf.d/mariadb-server.cnf
	mysql_install_db --user=mysql
	sleep 3
	mysqld_safe --defaults-file=/etc/my.cnf &
	sleep 3
	mysql -e "CREATE DATABASE cacti;"
	mysql cacti </usr/share/doc/cacti/cacti.sql
	mysql_tzinfo_to_sql /usr/share/zoneinfo | mysql mysql
	mysql -e "ALTER DATABASE cacti CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
	mysql -e "GRANT ALL ON cacti.* TO cactiuser@localhost IDENTIFIED BY 'cactiuser';"
	mysql -e "GRANT SELECT ON mysql.time_zone_name TO cactiuser@localhost;"
	mysql -e "FLUSH privileges;"
# Set php
	sed -i 's/max_execution_time = 30/max_execution_time = 60/g' /etc/php.ini
	sed -i 's/memory_limit = 128M/memory_limit = 400M/g' /etc/php.ini
	sed -i 's/;date.timezone =/date.timezone = Asia\/Shanghai/g' /etc/php.ini
	mkdir /run/php-fpm
	rm setup_waiting
# set crond
	sed -i 's/#\*\/5/*\/1/g' /etc/cron.d/cacti
else
	mysqld_safe --defaults-file=/etc/my.cnf &

fi
# start php-fpm,httpd
php-fpm
httpd -k start
crond -n

