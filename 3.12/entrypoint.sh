#!/bin/bash

# If the first argument is not an executable, prepend "hhvm"
if ! type -- "$1" &>/dev/null; then
	set -- hhvm "$@"
fi

exec "$@"
