FROM ubuntu:trusty

MAINTAINER ubuntu server cookbook

# Install base packages

RUN apt-get update && apt-get -yq install apache2 && \

apt-get clean && \

rm -rf /var/lib/apt/lists/*

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

ENV APACHE_RUN_USER www-data

ENV APACHE_RUN_GROUP www-data

ENV APACHE_LOG_DIR /var/log/apache2

ENV APACHE_PID_FILE /var/run/apache2.pid

ENV APACHE_LOCK_DIR /var/www/html

VOLUME ["/var/www/html"]

EXPOSE 80

CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]
