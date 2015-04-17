FROM ubuntu:latest
MAINTAINER Derick Schoonbee <derick.schoonbee@gmail.com>

RUN sed 's/main$/main universe/' -i /etc/apt/sources.list
RUN apt-get update && apt-get clean # 20130925

ENV PHP_MYADMIN_BLOWFISH changeme
ENV PHP_MYADMIN_HOST localhost

ENV DEBIAN_FRONTEND noninteractive
ENV INITRD No
ENV LANG en_US.UTF-8

RUN apt-get update && \
    apt-get install --no-install-recommends -y unzip php5 \
    php5-cli php5-mysqlnd php5-pgsql php5-sqlite php5-redis \
    php5-apcu php5-intl php5-imagick php5-mcrypt \
    php5-json php5-gd php5-curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ADD http://sourceforge.net/projects/phpmyadmin/files/latest/download /tmp/phpmyadmin.zip
WORKDIR /tmp
RUN unzip -q phpmyadmin.zip && rm phpmyadmin.zip && mv `ls` phpmyadmin && ls -lah phpmyadmin/
ADD config.inc.php /tmp/phpmyadmin/config.inc.php
RUN chmod 644 phpmyadmin/config.inc.php && rm -rf /var/www && mv phpmyadmin /var/www
CMD /usr/bin/php -S 0.0.0.0:80 -t /var/www/
EXPOSE 80
