# Created by wuta on 09/24/2021
# Update by ChengQing on 04/28/2022
FROM rockylinux
RUN dnf install -y epel-release \
    && dnf install -y cacti \
    && dnf install -y mariadb-server \
    && dnf install -y cacti-spine \
    && dnf clean all

# Add thold, monitor, syslog plugins
COPY thold /usr/share/cacti/plugins/thold
COPY monitor /usr/share/cacti/plugins/monitor
COPY syslog /usr/share/cacti/plugins/syslog

RUN touch setup_waiting
ADD cacti_container.sh /
CMD ["bash","cacti_container.sh"]
