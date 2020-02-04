# docker-olefy
Dockerfile to install [olefy](https://github.com/HeinleinSupport/olefy) as a docker container.


Environment variables and defaults:

```
OLEFY_BINDADDRESS '127.0.0.1'
OLEFY_BINDPORT '10050'
OLEFY_TMPDIR '/tmp'
OLEFY_PYTHON_PATH '/usr/bin/python3'
OLEFY_OLEVBA_PATH' '/usr/local/bin/olevba3'
# 10:DEBUG, 20:INFO, 30:WARNING, 40:ERROR, 50:CRITICAL
OLEFY_LOGLVL 20
OLEFY_MINLENGTH 500
OLEFY_DEL_TMP 1
OLEFY_DEL_TMP_FAILED 1
```

To run a container with tmpfs mount on /tmp and olevba in /usr/bin
```
#docker container run --mount type=tmpfs,destination=/tmp -p 10050:10050 -d --name olefy --env OLEFY_BINDADDRESS=0.0.0.0 --env OLEFY_OLEVBA_PATH=/usr/bin/olevba3 olefy
```
