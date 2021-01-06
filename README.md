![PHP-FPM-Laravel](https://img.shields.io/docker/pulls/dariopad/php-fpm-laravel.svg?style=flat-square)
![Nginx-Laravel](https://img.shields.io/docker/pulls/dariopad/nginx-laravel.svg?style=flat-square)

## Overview
This is a Dockerfile/image repository to build a set of container with nginx, php-fpm, redis and mysql, ready to be used with Laravel. There is the ability to pull website code from git when the PHP-FPM container is created, by using the start.sh script. Of course, you can just map your source code folder to the container for development purposes.
Certbot finally added and nginx ssl configuration enabled.

## Quick Start
Clone this repo:
```
git clone https://github.com/dariopalladino/laravel-dockers.git
```
### Running
Use docker-compose to run the whole architecture:
```
docker-compose -f docker-compose.dev.v2.yml up -d  #for Laravel 8
docker-compose -f docker-compose.dev.yml up -d  #for Laravel 5.5 to 7
```
To stop the whole architecture:
```
docker-compose down
```
To change image configurations or increase PHP version, edit the Dockerfile and run the docker-compose command with --build option. 

### PHP FPM image
PHP is based on version 7.2 and 7.4
- Standard modules installed are: 
curl, gd, bcmath, zip, bz2, pdo, pdo_pgsql, simplexml, opcache, sockets, mbstring, pcntl, xsl, pspell, tokenize, pdo_sqlite, pdo_mysql
- Extra modules installed are:
Xdebug, Imagick, Redis

### Note
I use these images for personal purposes on a development enviromnets. With some small tweacks, this architecture can be used for productive environments as well.

- I'll be adding MySQL Cluster with two nodes and a master node.
- I'll be adding Fail2Ban on the Nginx image
- Certbot is installed alongside with certbot nginx plugin. Certbot renew process is also scheduled with crontab to run every day for certificate renewal (no-self-upgrade, though)

### Images
- PHP FPM on Alpine 3.8 ready for Laravel
- NGINX on Alpine 3.8 ready for Laravel
- MYSQL official image
- REDIS on Alpine official image
- NPM:latest official image to manage frontend dependencies

### Versioning
| Docker Tag | Git Release | Nginx Version | PHP Version | Alpine Version | MySQL | Redis | NPM |
|-----|-------|-----|--------|--------|--------|--------|--------| 
| latest | Master Branch | 1.19.1 | 7.x.0 | 3.8 | 5.7.22 | latest | latest |


### Links
- [https://hub.docker.com/repository/docker/dariopad/php-fpm-laravel/general](https://hub.docker.com/repository/docker/dariopad/php-fpm-laravel/general)
- [https://hub.docker.com/repository/docker/dariopad/nginx-laravel/general](https://hub.docker.com/repository/docker/dariopad/nginx-laravel/general)

