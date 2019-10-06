FROM alpine

MAINTAINER André Carneiro <https://github.com/r4mmer/docker-redis-tools>

RUN apk update && \
    apk upgrade --no-cache && \
    apk add --no-cache --update --virtual build-deps gcc make linux-headers musl-dev && \
    wget http://download.redis.io/releases/redis-stable.tar.gz -O redis.tar.gz && \
    mkdir -p /build/redis && \
    tar -xzf redis.tar.gz -C /build/redis --strip-components=1 && \
    make -C /build/redis install redis-cli /usr/bin && \
    apk del build-deps make gcc && \
    rm -rf redis.tar.gz /build /var/cache/apk/*
