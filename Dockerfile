FROM brunoric/docker-apache2-php-mariadb:0.0.2
MAINTAINER brunoric <brunoric@gmail.com>

# Installing packages
RUN apt-get update
RUN apt-get -y install php5-intl curl php5-curl
RUN apt-get clean

# PHP Timezone
RUN sed -i "s/;date.timezone =/date.timezone = America\/Sao_Paulo/" /etc/php5/cli/php.ini && \
	sed -i "s/;date.timezone =/date.timezone = America\/Sao_Paulo/" /etc/php5/apache2/php.ini

# PHP Memory Limit
RUN sed -i "s/memory_limit = 128M/memory_limit = 256M/" /etc/php5/cli/php.ini

EXPOSE 80
CMD ["/start.sh"]