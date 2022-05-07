FROM alpine
RUN echo "https://mirrors.tuna.tsinghua.edu.cn/alpine/v3.15/main"> /etc/apk/repositories \
    && echo "https://mirrors.tuna.tsinghua.edu.cn/alpine/v3.15/community/">> /etc/apk/repositories
RUN apk add rsyslog
RUN mkdir /etc/rsyslog.d
CMD [rsyslog]
