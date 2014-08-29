FROM brunoric/docker-apache2-php-mariadb:0.0.2
MAINTAINER brunoric <brunoric@gmail.com>

# Installing packages
RUN apt-get update
RUN apt-get -y install php5-intl curl php5-curl
RUN apt-get clean

EXPOSE 80
CMD ["/start.sh"]