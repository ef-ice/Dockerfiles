FROM alpine:3.4

RUN apk add --no-cache --update curl bash ca-certificates openjdk7-jre-base git

ENV MAJOR_VERSION="16.6.0"
ENV MINOR_VERSION="3590"
ENV GOCD_VERSION="$MAJOR_VERSION-$MINOR_VERSION"
ENV DOWNLOAD_URL="https://download.go.cd/binaries/$GOCD_VERSION/generic/go-server-$GOCD_VERSION.zip"

WORKDIR /opt
RUN curl -SL -o "go-server-$GOCD_VERSION.zip" "$DOWNLOAD_URL"

RUN unzip "go-server-$GOCD_VERSION.zip" && \
rm "go-server-$GOCD_VERSION.zip" && \
ln -s "go-server-$MAJOR_VERSION" "go-server" && \
ln -s /opt/go-server/go.jar /usr/local/bin/go.jar && \
chmod +x /opt/go-server/server.sh && \
ln -s /opt/go-server/server.sh /usr/local/bin/server.sh && \
chmod +x /opt/go-server/stop-server.sh && \
ln -s /opt/go-server/stop-server.sh /usr/local/bin/stop-server.sh

RUN curl -SL -o "/opt/cacert.pem" "http://curl.haxx.se/ca/cacert.pem"
ENV SSL_CERT_FILE="/opt/cacert.pem"

COPY docker-entrypoint.sh /usr/local/bin/
COPY util.sh /usr/local/bin/

EXPOSE 8153

CMD []
ENTRYPOINT ["docker-entrypoint.sh"]
