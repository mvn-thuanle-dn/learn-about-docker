FROM ubuntu:16.04

LABEL author="thuan.le@monstar-lab.com"

RUN apt-get update

RUN apt-get install -y nginx

RUN echo "mysql-server mysql-server/root_password password root" | debconf-set-selections \
    && echo "mysql-server mysql-server/root_password_again password root" | debconf-set-selections \
    && apt-get install -y mysql-server

WORKDIR /code

COPY start.sh /

RUN chmod a+x /start.sh

ENTRYPOINT ["/start.sh"]

EXPOSE 80