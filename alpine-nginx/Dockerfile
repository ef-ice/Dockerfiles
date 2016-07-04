FROM alpine:3.3

# Install Nginx.
RUN apk add --no-cache --upgrade bash nginx apache2-utils

RUN chown -R nginx:nginx /var/lib/nginx

# Define mountable directories.
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"]

# Define working directory.
WORKDIR /etc/nginx

RUN mkdir /usr/share/nginx/logs

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
COPY nginx.conf nginx.conf

# Expose ports.
EXPOSE 80

# Define default command.
ENTRYPOINT ["docker-entrypoint.sh"]
CMD []
