# Set database
# sed -i '/\[mysqld\]/a character-set-server=utf8mb4 \
# collation-server=utf8mb4_unicode_ci' /etc/my.cnf.d/mariadb-server.cnf
mysql -u root -proot -e "CREATE DATABASE cacti;"
mysql_tzinfo_to_sql /usr/share/zoneinfo | mysql -u root -proot mysql
mysql -u root -proot -e "ALTER DATABASE cacti CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
mysql -u root -proot -e "GRANT ALL ON cacti.* TO cactiuser IDENTIFIED BY 'cactiuser';"
mysql -u root -proot -e "GRANT SELECT ON mysql.time_zone_name TO cactiuser;"
mysql -u root -proot -e "FLUSH privileges;"
