FROM erlang:17-slim

MAINTAINER Sergii Demianchuk, sergeydemjanchyk@gmail.com

ENV ELIXIR_VERSION="v0.12.5" \
    LANG=C.UTF-8

RUN set -xe \
    && ELIXIR_DOWNLOAD_URL="https://github.com/elixir-lang/elixir/releases/download/${ELIXIR_VERSION}/Precompiled.zip" \
    && ELIXIR_DOWNLOAD_SHA256="7bf9a0c23288684050da669921fdb0d4ae36a52c86f606129e195643f8fffacc" \
    && buildDeps=' \
        ca-certificates \
        curl \
        unzip \
    ' \
    && apt-get update \
    && apt-get install -y --no-install-recommends $buildDeps \
    && curl -fSL -o elixir-precompiled.zip $ELIXIR_DOWNLOAD_URL \
    && echo "$ELIXIR_DOWNLOAD_SHA256 elixir-precompiled.zip" | sha256sum -c - \
    && unzip -d /usr/local elixir-precompiled.zip \
    && rm elixir-precompiled.zip \
    && apt-get purge -y --auto-remove $buildDeps \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
