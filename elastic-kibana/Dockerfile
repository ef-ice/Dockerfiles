FROM kibana:4.5

RUN /opt/kibana/bin/kibana plugin --install elasticsearch/marvel/2.3.2 && \
chown -R kibana:kibana /opt/kibana
