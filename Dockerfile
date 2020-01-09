FROM pandoc/latex

RUN apk add --update python python-dev

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
