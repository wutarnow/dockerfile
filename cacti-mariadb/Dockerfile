FROM mariadb
# Set the host timezone
RUN	ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# Set database
RUN sed -i '/\[mysqld\]/a character-set-server=utf8mb4 \
    collation-server=utf8mb4_unicode_ci' /etc/my.cnf.d/mariadb-server.cnf
