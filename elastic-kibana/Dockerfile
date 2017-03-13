FROM kibana:4.6.4

ENV MARVEL_VERSION=2.4.1

RUN /opt/kibana/bin/kibana plugin --install elasticsearch/marvel/$MARVEL_VERSION
RUN /opt/kibana/bin/kibana plugin --install elastic/sense

RUN chown -R kibana:kibana /opt/kibana

ENV NODE_OPTIONS="--max-old-space-size=512"