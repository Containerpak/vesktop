FROM ubuntu:26.04 AS source

ADD --checksum=sha256:0204a3fcf8861d11debf72a9be70423d2dca6d4698766b6fda7cfe39beea6a61 \
    https://github.com/Vencord/Vesktop/releases/download/v1.6.7/vesktop_1.6.7_amd64.deb \
    /tmp/vesktop.deb

FROM ghcr.io/containerpak/gtk3:main

RUN --mount=type=bind,from=source,source=/tmp/vesktop.deb,target=/run/vesktop.deb \
    apt update && \
    apt install -y --no-install-recommends /run/vesktop.deb && \
    cpak-clean-junk
