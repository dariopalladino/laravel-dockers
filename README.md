![docker hub](https://img.shields.io/docker/pulls/dariopad/php72-laravel.svg?style=flat-square)
![docker hub](https://img.shields.io/docker/pulls/dariopad/nginx-laravel.svg?style=flat-square)

## Overview
This is a Dockerfile/image to build a container for nginx, php-fpm and mysql, with the ability to pull website code from git when the container is created, by using the start.sh script. 

### Images
- PHP FPM on Alpine 3.8
- NGINX on Alpine 3.8
- MYSQL official image
- REDIS on Alpine official image

### Versioning
| Docker Tag | Git Release | Nginx Version | PHP Version | Alpine Version | MySQL | Redis |
|-----|-------|-----|--------|--------|--------|--------| 
| latest/1.0.0 | Master Branch | 1.19.1 | 7.2.0 | 3.8 | 5.7.2 | latest |

### Note
I use these images for personal purposes for a development enviromnet. With some small enhancements, this architecture can be used also for productive environments.

- I'll be adding MySQL Cluster with two nodes and a master node.
- I'll be adding Fail2Ban on the Nginx image
- I'll be improving Cerbot management. In the current version, this implementation is not completed and therefore, not ready for a productive environment.
- I'll be adding the NPM image for frontend dependency management.

### Links
- [https://hub.docker.com/repository/docker/dariopad/php72-laravel/general](https://hub.docker.com/repository/docker/dariopad/php72-laravel/general)
- [https://hub.docker.com/repository/docker/dariopad/nginx-laravel/general](https://hub.docker.com/repository/docker/dariopad/php72-laravel/general)

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
