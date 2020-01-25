FROM ubuntu:disco

RUN apt update && apt install -y \ 
      wget git python3-dev python3-pip \ 
      imagemagick
      
RUN wget https://github.com/jgm/pandoc/releases/download/2.9.1.1/pandoc-2.9.1.1-1-amd64.deb && \
    dpkg -i pandoc-2.9.1.1-1-amd64.deb

RUN export DEBIAN_FRONTEND="noninteractive" && apt install -y tzdata texlive-full

RUN sed -i 's/rights="none"/rights="read|write"/g' /etc/ImageMagick-6/policy.xml

RUN wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sh /dev/stdin

WORKDIR /data

COPY VERSION /VERSION

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]