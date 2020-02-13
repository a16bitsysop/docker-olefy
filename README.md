# docker-olefy
Dockerfile to install [olefy](https://github.com/HeinleinSupport/olefy) as a docker container.

[![Docker Pulls](https://img.shields.io/docker/pulls/a16bitsysop/olefy.svg?style=flat-square)](https://hub.docker.com/r/a16bitsysop/olefy/)
[![Docker Stars](https://img.shields.io/docker/stars/a16bitsysop/olefy.svg?style=flat-square)](https://hub.docker.com/r/a16bitsysop/olefy/)
[![](https://images.microbadger.com/badges/version/a16bitsysop/olefy.svg)](https://microbadger.com/images/a16bitsysop/olefy "Get your own version badge on microbadger.com")

## Github
Github Repository: [https://github.com/a16bitsysop/docker-olefy](https://github.com/a16bitsysop/docker-olefy)

## Environment Variables
| Name                 | Desription                                                      | Default                |
| -------------------- | --------------------------------------------------------------- | ---------------------- |
| OLEFY_BINDADDRESS    | Address that olefy binds to                                     | 127.0.0.1              |
| OLEFY_BINDPORT       | Port that olefy listens on                                      | 10050                  |
| OLEFY_TMPDIR         | Temporary folder                                                | /tmp                   |
| OLEFY_PYTHON_PATH    | Path of the python interpreter                                  | /usr/bin/python3       |
| OLEFY_OLEVBA_PATH    | Path to oletools olevba                                         | /usr/local/bin/olevba3 |
| OLEFY_LOGLVL         | Log level, 10:DEBUG, 20:INFO, 30:WARNING, 40:ERROR, 50:CRITICAL | 20                     |
| OLEFY_MINLENGTH      | Minimum size of file to scan                                    | 500                    |
| OLEFY_DEL_TMP        | Delete temp files after use                                     | 1                      |
| OLEFY_DEL_TMP_FAILED | Delete temp files on failure                                    | 1                      |


## Examples
**To run a container with tmpfs mount on /tmp and olevba in /usr/bin**
```
#docker container run --mount type=tmpfs,destination=/tmp -p 10050:10050 -d --name olefy --env OLEFY_BINDADDRESS=0.0.0.0 --env OLEFY_OLEVBA_PATH=/usr/bin/olevba3 a16bitsysop/olefy
```
