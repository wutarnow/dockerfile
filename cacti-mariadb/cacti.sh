# Set database
# sed -i '/\[mysqld\]/a character-set-server=utf8mb4 \
# collation-server=utf8mb4_unicode_ci' /etc/my.cnf.d/mariadb-server.cnf
mysql -e "CREATE DATABASE cacti;"
mysql_tzinfo_to_sql /usr/share/zoneinfo | mysql mysql
mysql -e "ALTER DATABASE cacti CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
mysql -e "GRANT ALL ON cacti.* TO cactiuser@localhost IDENTIFIED BY 'cactiuser';"
mysql -e "GRANT SELECT ON mysql.time_zone_name TO cactiuser@localhost;"
mysql -e "FLUSH privileges;"
