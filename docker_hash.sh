#!/bin/sh
docker container run --rm $1 sh -c "if [ -f /etc/githash ]; then cat /etc/githash; fi"
