FROM alpine:3.11
LABEL maintainer "Duncan Bellamy <dunk@denkimushi.com>"
ENV url=HeinleinSupport/olefy/master/olefy.py

WORKDIR /usr/local/bin
COPY entrypoint.sh .
RUN sed -i -e 's+v[[:digit:]]\..*\/+edge\/+g' /etc/apk/repositories \
&& apk add --no-cache openssl gzip py3-pip py3-cryptography py3-magic \
&& pip3 install wheel && pip3 install oletools \
&& wget -S https://raw.githubusercontent.com/$url 2>&1 | grep "ETag:" | sed -e s+ETag:.W/++g -e s+\"++g -e 's+^[[:space:]]*++' > /etc/githash \
&& chmod +x olefy.py \
&& addgroup olefy 2>/dev/null \
&& adduser -D --gecos "olefy scanner" --ingroup olefy olefy 2>/dev/null

WORKDIR /home/olefy/
COPY --chown=olefy:olefy profile .profile

CMD [ "entrypoint.sh" ]
EXPOSE 10050
