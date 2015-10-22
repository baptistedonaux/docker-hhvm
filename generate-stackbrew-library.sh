#!/bin/bash
set -e

declare -A aliases
aliases=(
	[master]='3 latest'
)

cd "$(dirname "$(readlink -f "$BASH_SOURCE")")"

versions=( */ )
versions=( "${versions[@]%/}" )
url='git://github.com/baptistedonaux/docker-hhvm'

echo '# maintainer: Baptiste Donaux <baptiste.donaux@gmail.com> (@baptistedonaux)'

for version in "${versions[@]}"; do
	commit="$(cd "$version" && git log -1 --format='format:%H' -- Dockerfile $(awk 'toupper($1) == "COPY" { for (i = 2; i < NF; i++) { print $i } }' Dockerfile))"
	fullVersion="$(grep -m1 'ENV HHVM_VERSION' "$version/Dockerfile" | cut -d' ' -f3 | sed 's/~/-/g')"

	versionAliases=()
	while [ "$fullVersion" != "$version" -a "${fullVersion%[.-]*}" != "$fullVersion" ]; do
		versionAliases+=( $fullVersion )
		fullVersion="${fullVersion%[.-]*}"
	done
	versionAliases+=( $version ${aliases[$version]} )

	echo
	for va in "${versionAliases[@]}"; do
		if [ $va != "master" ] ; then
			echo "$va: ${url}@${commit} $version"
		fi
	done
done
