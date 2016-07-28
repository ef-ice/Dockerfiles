FROM alpine:3.4

RUN apk add --no-cache --update curl bash ca-certificates openjdk7-jre-base git

ENV MAJOR_VERSION="16.6.0"
ENV MINOR_VERSION="3590"
ENV GOCD_VERSION="$MAJOR_VERSION-$MINOR_VERSION"
ENV DOWNLOAD_URL="https://download.go.cd/binaries/$GOCD_VERSION/generic/go-agent-$GOCD_VERSION.zip"

WORKDIR /opt
RUN curl -SL -o "go-agent-$GOCD_VERSION.zip" "$DOWNLOAD_URL"

RUN unzip "go-agent-$GOCD_VERSION.zip" && \
rm "go-agent-$GOCD_VERSION.zip" && \
ln -s "go-agent-$MAJOR_VERSION" "go-agent" && \
ln -s /opt/go-agent/agent-bootstrapper.jar /usr/local/bin/agent-bootstrapper.jar && \
chmod +x /opt/go-agent/agent.sh && \
ln -s /opt/go-agent/agent.sh /usr/local/bin/agent.sh && \
chmod +x /opt/go-agent/stop-agent.sh && \
ln -s /opt/go-agent/stop-agent.sh /usr/local/bin/stop-agent.sh

RUN curl -SL -o "/opt/cacert.pem" "http://curl.haxx.se/ca/cacert.pem"
ENV SSL_CERT_FILE="/opt/cacert.pem"

COPY docker-entrypoint.sh /usr/local/bin/
COPY util.sh /usr/local/bin/

EXPOSE 8154

CMD []
ENTRYPOINT ["docker-entrypoint.sh"]
