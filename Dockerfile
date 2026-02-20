FROM alpine:3.23

RUN apk add --no-cache s3cmd

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
