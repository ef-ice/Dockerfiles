FROM nginx:stable

COPY nginx/mime.types /etc/nginx/conf/mime.types
COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

EXPOSE 8000
#ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["docker-entrypoint.sh"]
