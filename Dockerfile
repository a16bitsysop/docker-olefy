FROM alpine:3.14
LABEL maintainer="Duncan Bellamy <dunk@denkimushi.com>"
ENV url=HeinleinSupport/olefy/master/olefy.py

# hadolint ignore=DL3018,DL3013
RUN addgroup olefy 2>/dev/null \
&& adduser -D --gecos "olefy scanner" --ingroup olefy olefy 2>/dev/null \
&& apk add -u --no-cache openssl gzip py3-pip py3-cryptography py3-magic \
&& pip3 install --no-cache-dir wheel \
&& pip3 install --no-cache-dir oletools

WORKDIR /home/olefy/
COPY --chown=olefy:olefy profile profile

WORKDIR /usr/local/bin
COPY travis-helpers/set-timezone.sh \
travis-helpers/health-nc.sh \
entrypoint.sh ./

SHELL [ "/bin/ash", "-o", "pipefail", "-c" ]
# hadolint ignore=DL3018
RUN wget -q -S https://raw.githubusercontent.com/$url 2>&1 | grep "ETag:" \
| sed -e s+\"++g -e 's+.*ETag:\ ++' > /etc/githash \
&& chmod +x olefy.py

CMD [ "entrypoint.sh" ]
EXPOSE 10050

#commented as linter broken, build step uncomment
#HEALTHCHECK --start-period=60s CMD health-nc.sh PING 10050 PONG || exit 1
