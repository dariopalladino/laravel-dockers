![PHP72-Laravel](https://img.shields.io/docker/pulls/dariopad/php72-laravel.svg?style=flat-square)
![Nginx-Laravel](https://img.shields.io/docker/pulls/dariopad/nginx-laravel.svg?style=flat-square)

## Overview
This is a Dockerfile/image repository to build a set of container with nginx, php-fpm, redis and mysql, ready to be used with Laravel. There is the ability to pull website code from git when the PHP-FPM container is created, by using the start.sh script. Of course, you can just map your source code folder to the container for development purposes.


## Quick Start
Clone this repo:
```
git clone https://github.com/dariopalladino/laravel-dockers.git
```
### Running
Use docker-compose to run the whole architecture:
```
docker-compose -f docker-compose.dev.yml up -d
```
To stop the whole architecture:
```
docker-compose down
```
To change image configurations or increase PHP version, edit the Dockerfile and run the docker-compose command with --build option. 

### PHP FPM image
PHP is based on version 7.2. I'll be adding the option to switch to version 7.4
- Standard modules installed are: 
curl, gd, bcmath, zip, bz2, pdo, pdo_pgsql, simplexml, opcache, sockets, mbstring, pcntl, xsl, pspell, opcache, pdo_mysql
- Extra modules installed are:
Xdebug, Imagick, Redis

### Note
I use these images for personal purposes for a development enviromnet. With some small enhancements, this architecture can be used also for productive environments.

- I'll be adding MySQL Cluster with two nodes and a master node.
- I'll be adding Fail2Ban on the Nginx image
- I'll be improving Cerbot management. In the current version, this implementation is not completed and therefore, not ready for a productive environment.
- I'll be adding the NPM image for frontend dependency management.

### Images
- PHP FPM on Alpine 3.8 ready for Laravel
- NGINX on Alpine 3.8 ready for Laravel
- MYSQL official image
- REDIS on Alpine official image
- NPM:latest official image to manage frontend dependencies

### Versioning
| Docker Tag | Git Release | Nginx Version | PHP Version | Alpine Version | MySQL | Redis | NPM |
|-----|-------|-----|--------|--------|--------|--------|--------| 
| latest/1.0.0 | Master Branch | 1.19.1 | 7.2.0 | 3.8 | 5.7.22 | latest | latest |


### Links
- [https://hub.docker.com/repository/docker/dariopad/php72-laravel/general](https://hub.docker.com/repository/docker/dariopad/php72-laravel/general)
- [https://hub.docker.com/repository/docker/dariopad/nginx-laravel/general](https://hub.docker.com/repository/docker/dariopad/php72-laravel/general)

