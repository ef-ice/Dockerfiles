FROM kibana:4.5.1

RUN /opt/kibana/bin/kibana plugin --install elasticsearch/marvel/2.3.3 && \
chown -R kibana:kibana /opt/kibana
