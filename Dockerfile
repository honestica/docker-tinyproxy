###############################################################################
# Name:         Dockerfile
# Author:       Daniel Middleton <daniel-middleton.com>
# Description:  Dockerfile used to build dannydirect/tinyproxy
# Usage:        docker build -t dannydirect/tinyproxy:latest .
###############################################################################

FROM alpine:latest

MAINTAINER Daniel Middleton <daniel-middleton.com>

RUN sed -i -e 's/dl-cdn/nl/' /etc/apk/repositories && \
    apk update \
    && apk add \
	bash \
	tinyproxy

ADD run.sh /opt/docker-tinyproxy/run.sh

ENTRYPOINT ["/opt/docker-tinyproxy/run.sh"]
