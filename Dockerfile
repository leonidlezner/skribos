FROM alpine:3.10

RUN apt-get update && apt-get install git -y

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
