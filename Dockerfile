FROM alpine:3.11
LABEL maintainer "Duncan Bellamy <dunk@denkimushi.com>"
ENV url=HeinleinSupport/olefy/master/olefy.py

WORKDIR [ /usr/local/bin ]
RUN apk add --no-cache python3 libffi py3-magic openssl gzip
RUN apk add --virtual .build-deps gcc musl-dev python3-dev libffi-dev openssl-dev curl && \
python3 -m pip install -U pip && python3 -m pip install -U wheel setuptools oletools && \
curl -sSI https://raw.githubusercontent.com/$url | grep "^ETag:" | sed -e s+ETag:.W/++g -e s+\"++g > /etc/githash && \
apk del .build-deps && \
wget https://raw.githubusercontent.com/$url

USER nobody 
CMD [ "python3", "-u", "olefy.py" ]

EXPOSE 10050
