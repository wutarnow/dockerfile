FROM mariadb
# Set the host timezone
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
ADD cacti.sh /docker-entrypoint-initdb.d


