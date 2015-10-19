FROM debian:jessie

ENV HHVM_VERSION 3.9.1~jessie

RUN apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0x5a16e7281be7a449 \
	&& echo 'deb http://dl.hhvm.com/debian jessie-lts-3.9 main' > /etc/apt/sources.list.d/hhvm.list \
	&& apt-get update && apt-get install -y --no-install-recommends \
        hhvm=$HHVM_VERSION \
    && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh

EXPOSE 9000

ENTRYPOINT ["/entrypoint.sh"]