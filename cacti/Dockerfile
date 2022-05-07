# Created by wuta on 09/24/2021
# Update by ChengQing on 05/07/2022
FROM rockylinux
RUN dnf install -y epel-release \
    && dnf install -y cacti \
    && dnf install -y mariadb-server \
    && dnf install -y cacti-spine \
    && dnf clean all

# Add thold, monitor, syslog plugins
ADD  plugin_thold-develop.zip /usr/share/cacti/plugins/
ADD  plugin_monitor-develop.zip /usr/share/cacti/plugins/
ADD  plugin_syslog-develop.zip /usr/share/cacti/plugins/

RUN touch setup_waiting
ADD cacti_container.sh /
CMD ["bash","cacti_container.sh"]
