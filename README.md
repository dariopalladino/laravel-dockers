![pipeline status](https://gitlab.com/dariopalladino/laravel-dockers/badges/master/pipeline.svg)
![docker hub](https://img.shields.io/docker/pulls/dariopad/php72-laravel.svg?style=flat-square)
![docker hub](https://img.shields.io/docker/pulls/dariopad/nginx-laravel.svg?style=flat-square)

## Overview
This is a Dockerfile/image to build a container for nginx, php-fpm and mysql, with the ability to pull website code from git when the container is created, by using the start.sh script. 

### Versioning
| Docker Tag | Git Release | Nginx Version | PHP Version | Alpine Version | MySQL |
|-----|-------|-----|--------|--------|--------| 
| latest/1.0.0 | Master Branch | 1.19.1 | 7.2.0 | 3.8 | 5.7.2 |

### Links
- [https://hub.docker.com/repository/docker/dariopad/php72-laravel/general](https://hub.docker.com/repository/docker/dariopad/php72-laravel/general)
- [https://hub.docker.com/repository/docker/dariopad/nginx-laravel/general](https://hub.docker.com/repository/docker/dariopad/php72-laravel/general)

## Quick Start
Clone this repo:
```
git clone https://github.com/dariopalladino/laravel-dockers.git
```
### Running
Use docker-compose to build the whole architecture:
```
docker-compose -f docker-compose.dev.yml up -d --build
```
To stop the whole architecture:
```
docker-compose down
```
