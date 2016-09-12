FROM kibana:4.6.1

ENV MARVEL_VERSION=2.4.0
RUN /opt/kibana/bin/kibana plugin --install elasticsearch/marvel/$MARVEL_VERSION
RUN /opt/kibana/bin/kibana plugin --install elastic/sense


RUN chown -R kibana:kibana /opt/kibana
