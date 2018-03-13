FROM erlang:17

MAINTAINER Sergii Demianchuk, sergeydemjanchyk@gmail.com

ENV ELIXIR_VERSION="0.12.5" \
    ARCHIVE=elixir.tar.gz \
    LANG=C.UTF-8

RUN mkdir /opt/elixir
RUN cd /opt/elixir && \
    curl -fSL -o elixir-0.12.5.tar.gz https://github.com/elixir-lang/elixir/archive/v0.12.5.tar.gz && \
    tar xzf elixir-0.12.5.tar.gz && \
    cd elixir-0.12.5 && \
    make && \
    make install

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["iex"]
