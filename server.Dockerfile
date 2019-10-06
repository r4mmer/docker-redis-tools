FROM alpine

MAINTAINER André Carneiro <https://github.com/r4mmer/docker-redis-tools>

COPY --from=r4mmer/redis:full /usr/local/bin/redis-server /usr/local/bin

ENTRYPOINT ["redis-server"]
