FROM alpine:latest

RUN apk update && apk upgrade && \
apk add --update py-pip py-virtualenv gcc python-dev build-base bash jq util-linux curl && \
pip install --upgrade pip && \
pip install ansible boto awscli && \
rm -rfv /var/cache/apk/* /tmp/* /var/tmp/*

RUN echo "[localhost]" > ~/.ansible_hosts
RUN echo '127.0.0.1 ansible_python_interpreter=$VIRTUAL_ENV/bin/python' >> ~/.ansible_hosts

RUN mkdir .venv && \
virtualenv .venv && \
. .venv/bin/activate

COPY roles/ /opt/roles
COPY docker-cmd.sh /opt/

CMD ["/opt/docker-cmd.sh"]
