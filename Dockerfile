FROM alpine:3.11
LABEL maintainer "Duncan Bellamy <dunk@denkimushi.com>"
ENV url=HeinleinSupport/olefy/master/olefy.py

WORKDIR [ /usr/local/bin ]
RUN sed -i -e 's/v[[:digit:]]\..*\//edge\//g' /etc/apk/repositories \
&& apk add --no-cache openssl gzip py3-pip py3-magic py3-cryptography py3-cffi py3-six py3-setuptools py3-olefile \
&& pip3 install oletools \
&& wget -S https://raw.githubusercontent.com/$url 2>&1 | grep "ETag:" | sed -e s+ETag:.W/++g -e s+\"++g -e 's+^[[:space:]]*++' > /etc/githash

USER nobody 
CMD [ "python3", "-u", "olefy.py" ]

EXPOSE 10050
