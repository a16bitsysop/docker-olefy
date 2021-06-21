# docker-olefy
Alpine based Dockerfile to install [olefy](
https://github.com/HeinleinSupport/olefy) as a docker container.

[![Docker Pulls](https://img.shields.io/docker/pulls/a16bitsysop/olefy.svg?style=plastic)](https://hub.docker.com/r/a16bitsysop/olefy/)
[![Docker Stars](https://img.shields.io/docker/stars/a16bitsysop/olefy.svg?style=plastic)](https://hub.docker.com/r/a16bitsysop/olefy/)
[![Docker Image Version (tag latest semver)](https://img.shields.io/docker/v/a16bitsysop/olefy/latest?style=plastic)](https://hub.docker.com/r/a16bitsysop/olefy/)
[![Github SHA](https://img.shields.io/badge/dynamic/json?style=plastic&color=orange&label=Github%20SHA&query=object.sha&url=https%3A%2F%2Fapi.github.com%2Frepos%2Fa16bitsysop%2Fdocker-olefy%2Fgit%2Frefs%2Fheads%2Fmain)](https://github.com/a16bitsysop/docker-olefy)

## Github
Github Repository: [https://github.com/a16bitsysop/docker-olefy](
https://github.com/a16bitsysop/docker-olefy)

OLEFY_BINDADDRESS is already set to 0.0.0.0 to listen to all interfaces and
OLEFY_OLEVBA_PATH is set the correct path as well, this is done in the olefy
.profile file.

## Environment Variables
| Name                 | Desription                             | Default     |
| -------------------- | -------------------------------------- | ----------- |
| OLEFY_BINDPORT       | Port that olefy listens on             | 10050       |
| OLEFY_TMPDIR         | Temporary folder                       | /tmp        |
| OLEFY_PYTHON_PATH    | Path of the python interpreter    | /usr/bin/python3 |
| OLEFY_LOGLVL         | 10:DEBUG,20:INFO,30:WARNING,40:ERROR,50:CRITICAL | 20|
| OLEFY_MINLENGTH      | Minimum size of file to scan           | 500         |
| OLEFY_DEL_TMP        | Delete temp files after use            | 1           |
| OLEFY_DEL_TMP_FAILED | Delete temp files on failure           | 1           |
| TIMEZONE             | For container, eg Europe/London        | unset       |

## Examples
**To run a container with tmpfs mount on /tmp**
```bash
docker container run --mount type=tmpfs,destination=/tmp -p 10050:10050 \
-d --name olefy a16bitsysop/olefy
```
