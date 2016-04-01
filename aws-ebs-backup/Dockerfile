FROM alpine:latest

RUN apk update && apk upgrade && \
apk add --update curl jq python-dev gcc build-base && \
rm -rfv /var/cache/apk/* /tmp/* /var/tmp/*

WORKDIR /opt

RUN curl -L -O https://bootstrap.pypa.io/get-pip.py && \
python get-pip.py && \
rm get-pip.py && \
pip install -U ansible boto awscli virtualenv

RUN echo "[localhost]" > ~/.ansible_hosts
RUN echo '127.0.0.1 ansible_python_interpreter=$VIRTUAL_ENV/bin/python' >> ~/.ansible_hosts

COPY roles/ /opt/roles
COPY docker-cmd.sh /opt/

CMD ["/opt/docker-cmd.sh"]
