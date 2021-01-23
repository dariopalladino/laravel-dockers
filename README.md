![PHP-FPM-Laravel](https://img.shields.io/docker/pulls/dariopad/php-fpm-laravel.svg?style=flat-square)
![Nginx-Laravel](https://img.shields.io/docker/pulls/dariopad/nginx-laravel.svg?style=flat-square)

## Overview
This is a Dockerfile/image repository to build a set of container with nginx with certbot, php-fpm with composer, npm, redis and mysql, ready to be used with Laravel. There is the ability to pull website code from git when the PHP-FPM container is created, by using the start.sh script. Just add it to the entrypoint or run it manually from inside the container. Of course, you can just map your source code folder to the container and that's it.
Certbot is finally added and scheduled to run daily for renewal of the nginx ssl certificate.

## Quick Start
Clone this repo:
```
git clone https://github.com/dariopalladino/laravel-dockers.git
```
### Running
Use docker-compose to run the whole architecture:
```
docker-compose -f docker-compose.dev.v2.yml up -d  #for Laravel 8 use PHP 7.4
docker-compose -f docker-compose.dev.yml up -d  #for Laravel 5.5 to 7 use PHP 7.3
```
To stop the whole architecture:
```
docker-compose -f docker-compose.dev.??.yml down
```

### PHP FPM image
PHP FPM image is tagged for version 7.2, 7.3 and 7.4
- Standard modules installed are: 
curl, gd with jpeg and webp, bcmath, zip, bz2, pdo, pdo_pgsql, simplexml, opcache, sockets, mbstring, pcntl, xsl, pspell, tokenize, pdo_sqlite, pdo_mysql
- Extra modules installed are:
Xdebug (only 7.2 and 7.4), Imagick, Redis

### Note
I use these images for personal purposes on a development environmet. With some small tweaks, this architecture can be used for productive environments as well.

- [] I'll be adding MySQL Cluster with two nodes and a master node.
- [] I'll be adding Fail2Ban on the Nginx image
- [x] Certbot is installed alongside with certbot nginx plugin. Certbot renew process is also scheduled with crontab to run every day for certificate renewal (no-self-upgrade, though)

### Images
- PHP FPM on Alpine 3.8 ready for Laravel
- NGINX on Alpine 3.8 ready for Laravel
- MYSQL official image
- REDIS on Alpine official image
- NPM:latest official image to manage frontend dependencies

### Versioning
| Docker Tag | Git Release | Nginx Version | PHP Version | Alpine Version | MySQL | Redis | NPM |
|-----|-------|-----|--------|--------|--------|--------|--------| 
| latest | Master Branch | 1.19.1 | 7.x.0 | 3.8 | 5.7.32 | latest | latest |


### Links
- [https://hub.docker.com/repository/docker/dariopad/php-fpm-laravel/general](https://hub.docker.com/repository/docker/dariopad/php-fpm-laravel/general)
- [https://hub.docker.com/repository/docker/dariopad/nginx-laravel/general](https://hub.docker.com/repository/docker/dariopad/nginx-laravel/general)

