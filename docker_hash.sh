#!/bin/sh
docker image pull $1 > /dev/null 2>&1
[ $? -ne 0 ] && exit 0
docker container run --rm $1 sh -c "if [ -f /etc/githash ]; then cat /etc/githash; fi"
