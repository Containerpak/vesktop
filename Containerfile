FROM ubuntu:26.04 AS source

ADD --checksum=sha256:2d4c97abe4810703561d59c63cb12b1926f591fe1fe2bf9e914db66c6cc31cf5 \
    https://github.com/Vencord/Vesktop/releases/download/v1.6.5/vesktop_1.6.5_amd64.deb \
    /tmp/vesktop.deb

FROM ghcr.io/containerpak/mesa:main

COPY --from=source /tmp/vesktop.deb /tmp/vesktop.deb

RUN apt update && \
    apt install -y --no-install-recommends /tmp/vesktop.deb && \
    rm /tmp/vesktop.deb && \
    cpak-clean-junk
