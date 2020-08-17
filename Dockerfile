FROM alpine:3.12
LABEL maintainer "Duncan Bellamy <dunk@denkimushi.com>"
ENV url=HeinleinSupport/olefy/master/olefy.py

RUN sed -i -e 's+v[[:digit:]]\..*\/+edge\/+g' /etc/apk/repositories \
&& addgroup olefy 2>/dev/null \
&& adduser -D --gecos "olefy scanner" --ingroup olefy olefy 2>/dev/null \
&& apk add --no-cache openssl gzip py3-pip py3-cryptography py3-magic \
&& pip3 install --no-cache-dir wheel \
&& pip3 install --no-cache-dir oletools

WORKDIR /home/olefy/
COPY --chown=olefy:olefy profile profile

WORKDIR /usr/local/bin
COPY travis-helpers/set-timezone.sh entrypoint.sh ./

RUN wget -S https://raw.githubusercontent.com/$url 2>&1 | grep "ETag:" \
| sed -e s+\"++g -e 's+.*ETag:\ ++' > /etc/githash \
&& chmod +x olefy.py

CMD [ "entrypoint.sh" ]
EXPOSE 10050
