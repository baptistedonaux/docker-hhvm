#!/bin/bash
set -e

cd "$(dirname "$(readlink -f "$BASH_SOURCE")")"

versions=( "$@" )
if [ ${#versions[@]} -eq 0 ]; then
	versions=( */ )
fi
versions=( "${versions[@]%/}" )

for version in "${versions[@]}"; do
	if [ $version = "master" ] ; then
		repositoryVersion="jessie"
	else
		repositoryVersion="jessie-lts-${version}"
	fi

	repoBase="http://dl.hhvm.com/debian/dists/$repositoryVersion/main/binary-amd64"
	
	fullVersion="$(curl -fsSL "$repoBase/Packages" | awk -F ': ' '$1 == "Package" { pkg = $2 } pkg == "hhvm" && $1 == "Version" { print $2 }' | sort -rV | head -n1)"
	
	set -x
	cp Dockerfile.template "$version/"
	mv "$version/Dockerfile.template" "$version/Dockerfile"
	sed -i '
		s/%%HHVM_VERSION%%/'"$fullVersion"'/g;
		s/%%HHVM_REPOSITORY_VERSION%%/'"$repositoryVersion"'/g;
	' "$version/Dockerfile"
done
