# Created by wuta on 09/24/2021
# Update by ChengQing on 05/09/2022
FROM rockylinux
RUN dnf install -y epel-release \
    && dnf install -y cacti \
    && dnf install -y cacti-spine \
    && dnf clean all

# Add thold, monitor, syslog plugins
COPY thold /usr/share/cacti/plugins/thold
COPY monitor /usr/share/cacti/plugins/monitor
COPY syslog /usr/share/cacti/plugins/syslog

# Give the spine the proper permissions
RUN chmod u+s /usr/bin/spine

# Set the host timezone
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# Set php
RUN sed -i 's/max_execution_time = 30/max_execution_time = 60/g' /etc/php.ini \
    && sed -i 's/memory_limit = 128M/memory_limit = 400M/g' /etc/php.ini
    && sed -i 's/;date.timezone =/date.timezone = Asia\/Shanghai/g' /etc/php.ini
    && mkdir /run/php-fpm
    
# set crond (change /5m to /1m)
RUN sed -i 's/#\*\/5/*\/1/g' /etc/cron.d/cacti

CMD ["php-fpm","&&","httpd","-k","start","&&","crond","-n"]
