FROM pandoc/latex

RUN apk add --update git python3 python3-dev texlive-full

RUN git clone https://github.com/leonidlezner/skribos-cli.git /usr/local/skribos-cli && \
    python3 -m pip install -r /usr/local/skribos-cli/requirements.txt

COPY VERSION /VERSION

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
