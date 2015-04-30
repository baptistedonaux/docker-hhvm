FROM debian:8

RUN apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0x5a16e7281be7a449 \
	&& echo deb http://dl.hhvm.com/debian jessie main | tee /etc/apt/sources.list.d/hhvm.list \
	&& apt-get update \
	&& apt-get install -y \
		hhvm

EXPOSE 9000

ENTRYPOINT ["/usr/bin/hhvm", "--config" ,"/etc/hhvm/php.ini", "--user", "www-data"]
CMD ["--config", "/etc/hhvm/server.ini", "--mode", "server", "-vPidFile=/run/hhvm/pid"]