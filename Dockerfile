FROM debian:8

RUN apt-get update

RUN apt-get install -y gcc

RUN wget http://mydns.bboy.net/download/mydns-1.1.0.tar.gz && \
    tar zxf mydns-1.1.0.tar.gz -C / && \
    rm -f mydns-1.1.0.tar.gz && \
    mv /mydns-1.1.0 /mydns && \
    cd /mydns && \
    ./configure && \
    make && \
    make install

WORKDIR /mydns

ENTRYPOINT ["mydns"]
