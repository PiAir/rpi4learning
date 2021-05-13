FROM debian:9 as rq-build

ENV RQ_VERSION=1.0.2
WORKDIR /root/

RUN apt-get update && apt-get install -y upx wget
RUN wget https://github.com/dflemstr/rq/releases/download/v1.0.2/rq-v1.0.2-arm-unknown-linux-gnueabi.tar.gz
RUN tar -xvf rq-v1.0.2-arm-unknown-linux-gnueabi.tar.gz
RUN upx --brute rq

FROM library/docker:stable

COPY --from=rq-build /root/rq /usr/local/bin

ENV HOME_DIR=/opt/crontab
RUN apk add --no-cache --virtual .run-deps gettext jq bash tini
RUN mkdir -p ${HOME_DIR}/jobs ${HOME_DIR}/projects 
RUN adduser -S docker -D

COPY docker-entrypoint /
RUN ["chmod", "+x", "/docker-entrypoint"]
ENTRYPOINT ["/sbin/tini", "--", "/docker-entrypoint"]

HEALTHCHECK --interval=5s --timeout=3s \
    CMD ps aux | grep '[c]rond' || exit 1

CMD ["crond", "-f", "-d", "6", "-c", "/etc/crontabs"]
