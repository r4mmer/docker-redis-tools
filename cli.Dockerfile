FROM alpine

MAINTAINER André Carneiro <https://github.com/r4mmer/docker-redis-tools>

COPY --from=r4mmer/redis:full /usr/local/bin/redis-cli /usr/local/bin

ENTRYPOINT ["redis-cli"]
