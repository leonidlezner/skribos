FROM pandoc/latex

RUN apk add --update python3 python3-dev python3-pip && \
    git clone https://github.com/leonidlezner/skribos-cli.git && \
    pip3 install -r skribos-cli/requirements.txt

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
