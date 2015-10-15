FROM debian:jessie

ENV HHVM_VERSION 3.6.6~jessie

RUN apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0x5a16e7281be7a449 \
	&& echo 'deb http://dl.hhvm.com/debian jessie-lts-3.6 main' > /etc/apt/sources.list.d/hhvm.list \
	&& apt-get update && apt-get install -y --no-install-recommends \
        hhvm=$HHVM_VERSION \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 9000

ENTRYPOINT ["hhvm"]
CMD ["-m", "server", "-vServer.Type=fastcgi", "-vServer.Port=9000"]