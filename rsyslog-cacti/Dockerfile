FROM wutarnow/wuta:rsyslog
RUN apk add rsyslog-mysql
ADD cacti.conf /etc/rsyslog.d/
CMD ["rsyslog"]
