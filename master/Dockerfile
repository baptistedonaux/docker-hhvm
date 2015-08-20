FROM debian:8
MAINTAINER Baptiste Donaux <baptiste.donaux@gmail.com>

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		autoconf \
		automake \
		binutils \
		binutils-dev \
		build-essential \
		ca-certificates \
		cmake \
		cmake-data \
		cpp \
		g++ \
		g++-4.8 \
		gawk \
		gcc \
		gcc-4.8 \
		git-core \
		gperf \
		libacl1 \
		libarchive13 \
		libattr1 \
		libboost-context1.55-dev \
		libboost-filesystem1.55-dev \
		libboost-program-options1.55-dev \
		libboost-regex1.55-dev \
		libboost-system1.55-dev \
		libboost-thread-dev \
		libboost-thread1.55.0 \
		libbz2-dev \
		libc-bin \
		libc-client2007e-dev \
		libc-dev-bin \
		libc6 \
		libc6-dev \
		libcap-dev \
		libcloog-ppl-dev \
		libcurl4-openssl-dev \
		libdwarf-dev \
		libelf-dev \
		libevent-dev \
		libgcc1 \
		libgd2-xpm-dev \
		libgomp1 \
		libgoogle-glog-dev \
		libgoogle-perftools-dev \
		libiberty-dev \
		libicu-dev \
		libjemalloc-dev \
		libkrb5-dev \
		libldap2-dev \
		libmagickwand-dev \
		libmcrypt-dev \
		libmemcached-dev \
		libmpfr4 \
		libmysqlclient-dev \
		libncurses5-dev \
		libonig-dev \
		libpcre3-dev \
		libreadline-dev \
		libstdc++-4.8-dev \
		libstdc++6 \
		libtbb-dev \
		libtbb2 \
		libtool \
		libunwind8-dev \
		libxml2-dev \
		libxslt-dev \
		libyaml-dev \
		make \
		memcached \
		ocaml-native-compilers \
		openssl \
		php5-imagick \
		php5-mcrypt \
		pkg-config \
		subversion \
		wget \
		zlib1g-dev \
	&& mkdir /tmp/dev \
	&& cd /tmp/dev \
	&& git clone git://github.com/facebook/hhvm.git --depth=1 \
	&& export CMAKE_PREFIX_PATH=`pwd` \
	&& cd /tmp/dev/hhvm \
	&& git submodule update --init --recursive \
	&& cmake . \
	&& make -j"$(nproc)" \
	&& make install \
	&& make clean \
	&& rm -rf /tmp/dev \
	&& apt-get purge -y --auto-remove \
		autoconf \
		automake \
		binutils \
		binutils-dev \
		build-essential \
		ca-certificates \
		cmake \
		cmake-data \
		cpp \
		g++ \
		g++-4.8 \
		gawk \
		gcc \
		gcc-4.8 \
		git-core \
		gperf \
		libtcmalloc-minimal4 \
		make \
		memcached \
		ocaml-native-compilers \
		openssl \
		php5-imagick \
		php5-mcrypt \
		pkg-config \
		subversion \
		wget \
		zlib1g-dev \
	&& apt-get install -y --no-install-recommends \
		libc-client2007e \
		libmagickwand-dev \
		libvpx1 \
	&& apt-get autoremove --purge \
	&& rm -rf /var/lib/apt/lists/*

ENTRYPOINT /usr/local/bin/hhvm
CMD -m server