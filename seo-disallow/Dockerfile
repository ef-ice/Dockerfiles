FROM nginx:stable

COPY nginx/mime.types /etc/nginx/conf/mime.types
COPY nginx/nginx.conf /etc/nginx/nginx.conf
RUN mkdir -p /var/www/robots
COPY robots.txt /var/www/robots/robots.txt
COPY pgEBCy5JML.txt /var/www/robots/pgEBCy5JML.txt
COPY bin/docker-run.sh /usr/local/bin/docker-run.sh
EXPOSE 8000

ENTRYPOINT ["/usr/local/bin/docker-run.sh"]
