FROM ubuntu

RUN apt update && apt install -y \ 
      wget git python3-dev python3-pip \ 
      pandoc imagemagick

RUN export DEBIAN_FRONTEND="noninteractive" && apt install -y tzdata texlive-full

RUN sed -i 's/rights="none"/rights="read|write"/g' /etc/ImageMagick-6/policy.xml

RUN git clone https://github.com/leonidlezner/skribos-cli.git /usr/local/skribos-cli && \
    pip3 install -r /usr/local/skribos-cli/requirements.txt

RUN wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sh /dev/stdin

WORKDIR /data

COPY VERSION /VERSION

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]