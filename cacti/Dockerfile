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

RUN touch setup_waiting
ADD cacti_container.sh /
CMD ["bash","cacti_container.sh"]
