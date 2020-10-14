#!/bin/sh
echo PING | nc 127.0.0.1 10050 | grep -q PONG
