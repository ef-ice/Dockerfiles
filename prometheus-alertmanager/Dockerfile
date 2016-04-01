FROM prom/alertmanager
ADD config/ /etc/alertmanager/
ADD configure-run.sh /configure-run.sh
ENTRYPOINT ["/configure-run.sh"]
