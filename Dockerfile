FROM pandoc/latex

RUN apk add --update python python-dev && \
    git clone https://github.com/leonidlezner/skribos-cli.git && \
    pip install -r skribos-cli/requirements.txt

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
