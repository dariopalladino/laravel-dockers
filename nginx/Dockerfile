FROM nginx:alpine

RUN apk add python3 python3-dev py3-pip build-base libressl-dev musl-dev libffi-dev
RUN pip3 install pip --upgrade
RUN pip3 install certbot-nginx
RUN mkdir /etc/letsencrypt

# Copy existing application directory contents
COPY .docker/nginx/ssl/* /etc/nginx/conf.d/
RUN echo '05 23 * * * /usr/bin/certbot renew --quiet --no-self-upgrade' >> /var/spool/cron/crontabs/root