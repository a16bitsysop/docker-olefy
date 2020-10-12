FROM alpine:3.12
LABEL maintainer="Duncan Bellamy <dunk@denkimushi.com>"
ENV url=HeinleinSupport/olefy/master/olefy.py

# hadolint ignore=DL3018
RUN addgroup olefy 2>/dev/null \
&& adduser -D --gecos "olefy scanner" --ingroup olefy olefy 2>/dev/null \
&& apk add --no-cache openssl gzip py3-pip py3-cryptography py3-magic \
&& pip3 install --no-cache-dir wheel \
&& pip3 install --no-cache-dir oletools

WORKDIR /home/olefy/
COPY --chown=olefy:olefy profile profile

WORKDIR /usr/local/bin
COPY travis-helpers/set-timezone.sh entrypoint.sh ./

COPY olefy-pinglog.patch /tmp
SHELL [ "/bin/ash", "-o", "pipefail", "-c" ]
# hadolint ignore=DL3018
RUN wget -S https://raw.githubusercontent.com/$url 2>&1 | grep "ETag:" \
| sed -e s+\"++g -e 's+.*ETag:\ ++' > /etc/githash \
&& chmod +x olefy.py \
&& apk add --no-cache patch \
&& patch -p1 -i /tmp/olefy-pinglog.patch \
&& apk del patch \
&& rm /tmp/olefy-pinglog.patch

CMD [ "entrypoint.sh" ]
EXPOSE 10050

HEALTHCHECK CMD [ "$(echo PING | nc 127.0.0.1 10050)" = "PONG" ]
