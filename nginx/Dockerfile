FROM nginx:alpine

RUN apk add python3 python3-dev py3-pip build-base libressl-dev musl-dev libffi-dev
RUN pip3 install pip --upgrade
RUN pip3 install certbot-nginx
RUN mkdir /etc/letsencrypt

# Copy existing application directory contents
COPY .docker/nginx/ssl/* /etc/nginx/conf.d/

# Scheduling Cerbot only if required
RUN if [[-z "$SCHEDULE_CERBOT"]] ; then echo "Cerbot won't be scheduled!" ; else echo '05 23 * * * /usr/bin/certbot renew --quiet --no-self-upgrade' >> /var/spool/cron/crontabs/root ; fi