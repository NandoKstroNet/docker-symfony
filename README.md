docker-apache2-php-mariadb-symfony
==================================

Docker image to PHP and MariaDB 10 (MySQL) Symfony standard projects.

How to get?
-----------

You have two options to build this image, the first one is pull from Docker Hub:

	docker pull brunoric/docker-apache2-php-mariadb-symfony

You can also clone `brunoric/docker-apache2-php-mariadb-symfony` from GitHub and build it yourself from the Dockerfile
with the following command executed on the `docker-apache2-php-mariadb-symfony` folder:

	docker build -t brunoric/docker-apache2-php-mariadb-symfony .

How to use?
-----------

Start the container with the below command:

	docker run -d -p 80:80 -p 3306:3306 \
		-v /symfony/project/root:/app \
        -v /symfony/project/web:/public \
		brunoric/docker-apache2-php-mariadb-symfony

To check what is the IP of your container just run the command below:

    docker inspect --format '{{ .NetworkSettings.IPAddress }}' <CONTAINER_ID>

What does this command?
-----------------------

- The `-p` parameters bind ports to the container, thereby `-p 80:80` and `-p 3306:3306` bind port 80 and 3306 of your
system to the exposed ports of Apache2 and MariaDB 10 respectively.

- The `-v` parameter mount volumes of your system into the container. Change `/symfony/project/root` to the real path of
 the your Symfony project root and  `/symfony/project/web` to your Symfony aplication's web directory. The `/public` is
 the Apache2 root of this image, so when you mount your folder public application that will be accessible via
 `http://<CONTAINER_IP>`.

Important notes
---------------

- Your application is accessible via `http://<CONTAINER_IP>` and your database.
`mysql -uadmin -pchange@this*passw0rd -h<CONTAINER_IP> -P3306`.
- Don't forget to change your `admin` password with `mysqladmin -uadmin -pchange@this*passw0rd NEWPASSWORD`.

Docker images relationship
--------------------------

- `docker-apache2-php-mariadb-symfony` extends `docker-apache2-php-mariadb`.
- `docker-apache2-php-mariadb` extends `docker-apache2-php`.
- `docker-apache2-php` extends `ubuntu:trusty`

Additional notes
----------------

- [Docker documentation][1].
- [brunoric at Docker Hub][2].

[1]: https://docs.docker.com
[2]: https://registry.hub.docker.com/u/brunoric