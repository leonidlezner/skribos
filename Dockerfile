FROM pandoc/latex

RUN apk add --update git python3 python3-dev && \
    git clone https://github.com/leonidlezner/skribos-cli.git /usr/local/ && \
    python3 -m pip install -r /usr/local/skribos-cli/requirements.txt

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
