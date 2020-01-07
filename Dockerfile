FROM alpine:3.10

COPY entrypoint.sh /entrypoint.sh

ARG GITHUB_REF
ENV REF=$GITHUB_REF

ENTRYPOINT ["/entrypoint.sh"]
