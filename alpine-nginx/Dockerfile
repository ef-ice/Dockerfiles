FROM alpine:3.3

# TODO can be removed later I think
RUN sed -i 's~dl-cdn~dl-4~g' /etc/apk/repositories

# Install Nginx.
RUN apk add --no-cache --upgrade bash nginx apache2-utils

RUN chown -R nginx:nginx /var/lib/nginx

# Define mountable directories.
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"]

# Define working directory.
WORKDIR /etc/nginx

RUN mkdir /usr/share/nginx/logs

COPY docker-cmd.sh docker-cmd.sh
COPY nginx.conf nginx.conf

# Expose ports.
EXPOSE 80

# Define default command.
CMD ["./docker-cmd.sh"]
