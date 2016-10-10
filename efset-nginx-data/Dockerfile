FROM nginx:stable

COPY nginx/mime.types /etc/nginx/conf/.
COPY nginx/nginx.conf /etc/nginx/conf/.
COPY docker-entrypoint.sh /usr/local/bin/.

ENTRYPOINT ["docker-entrypoint.sh"]
CMD []
