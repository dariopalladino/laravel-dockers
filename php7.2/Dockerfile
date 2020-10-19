#Step 1
FROM php:7.2-fpm-alpine3.8

LABEL version="1.0"

#Step 2
ARG uid

#Step 3
ARG user

#Step 4
WORKDIR /var/www

#Step 5
RUN echo "*** USER: $user" && echo "*** UID: $uid" \
    && echo "*** Upgrading Alpine! ***" \
    && apk update && apk upgrade \
    && echo "*** Adding php libraries! ***" \
    && apk add --no-cache curl libbz2 php7-bz2 php7-pdo php7-pgsql php7-bcmath php7-zmq php7-curl bash php7-pear php7-imagick openssh nano supervisor\
    libtool postgresql-dev libpng-dev imagemagick-c++ imagemagick-dev libmcrypt-dev libxml2-dev \
    yaml-dev bzip2 aspell-dev autoconf build-base linux-headers libaio-dev zlib-dev git subversion freetype-dev \
    libjpeg-turbo-dev libmcrypt-dev bzip2-dev libstdc++ libxslt-dev openldap-dev hiredis-dev make unzip \
    ffmpeg wget 
    #&& apk cache clean

#Step 6
RUN echo "*** Installing Composer! ***" \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && echo "*** Installing PHP extentions! ***" \
    && docker-php-ext-install gd bcmath zip bz2 pdo pdo_pgsql simplexml opcache sockets mbstring pcntl xsl pspell opcache pdo_mysql \
    && echo "*** Configuring PHP GD extension! ***" \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && echo "*** Installing Imagick extension! ***" \
    && pecl install imagick \
    && echo "*** Enabling PHP Imagick extentions! ***" \
    && docker-php-ext-enable imagick \
    && echo "*** Installing PHP Redis extentions! ***" \
    && pecl install -o -f redis \
    && echo "*** Enabling Redis extention! ***" \
    && docker-php-ext-enable redis \
    && echo "*** Installing PHP XDebug extention! ***" \
    && pecl install xdebug \
    && wget http://xdebug.org/files/xdebug-2.6.1.tgz \
    && tar -xvzf xdebug-2.6.1.tgz \
    && cd xdebug-2.6.1 \
    && echo "*** Configuring XDebug! ***" \
    && phpize \
    && ./configure --enable-xdebug \
    && make \
    && make install \
    && cp modules/xdebug.so /usr/local/lib/php/extensions/no-debug-non-zts-20170718 \
    && echo 'zend_extension = /usr/local/lib/php/extensions/no-debug-non-zts-20170718/xdebug.so' >> /usr/local/etc/php/php.ini \
    && echo 'zend_extension = /usr/local/lib/php/extensions/no-debug-non-zts-20170718/xdebug.so' >> /etc/php7/php.ini \
    && echo 'xdebug.remote_enable=true' >> /etc/php7/php.ini \
    && echo 'xdebug.remote_host=127.0.0.1' >> /etc/php7/php.ini \
    && echo 'xdebug.remote_port=9000' >> /etc/php7/php.ini \
    && echo 'xdebug.remote_handler=dbgp' >> /etc/php7/php.ini \
    && echo 'xdebug.max_nesting_level=512' >> /etc/php7/php.ini \
    && rm -rf /tmp/pear

#Step 7
# Add user for laravel application
RUN echo "*** Adding user! ***" \
    && adduser -S -D --ingroup www-data --uid $uid -h /home/$user --shell /bin/bash $user \
    && chown -R $user:www-data .

#Step 8
ADD .docker/php/scripts/start.sh /start.sh

#Step 9
RUN mkdir -p /var/temp \
    && chown -R $user:www-data /var/temp \
    && chown $user:www-data /start.sh \
    && chmod 775 /start.sh

#Step 10
ADD .docker/php/laravel/.env /var/temp

#Step 11
# Change current user to www
USER $user

#Step 13
# RUN configuration script
#CMD ["/start.sh", "$user"]