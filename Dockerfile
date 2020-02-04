FROM alpine:3.11
LABEL maintainer "Duncan Bellamy <dunk@denkimushi.com>"

WORKDIR [ /usr/local/bin ]
RUN apk add --no-cache python3 libffi py3-magic openssl gzip && \
apk add --virtual .build-deps wget gcc musl-dev python3-dev libffi-dev openssl-dev && \
python3 -m pip install -U pip && python3 -m pip install -U wheel setuptools oletools && \
apk del .build-deps && \
wget https://raw.githubusercontent.com/HeinleinSupport/olefy/master/olefy.py

USER nobody 
ENTRYPOINT [ "python3", "-u", "olefy.py" ]

VOLUME [ "/tmp" ]
EXPOSE 10050
