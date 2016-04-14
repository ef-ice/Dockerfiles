FROM mhart/alpine-node:5.9.1

RUN mkdir /root_dir

RUN npm install -g http-server
EXPOSE 8080 50000
ENTRYPOINT ["http-server"]
CMD ["/root_dir"]
