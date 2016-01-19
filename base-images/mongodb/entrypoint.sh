#!/bin/bash
set -e

if [ "${1:0:1}" = '-' ]; then
	set -- mongod "$@"
fi

if [ "$1" = 'mongod' ]; then
	chown -R mongodb /data/db

	numa='numactl --interleave=all'
	if $numa true &> /dev/null; then
		set -- $numa "$@"
	fi

	if [ -f "/data/db/mongod.lock" ]; then

		echo "Repairing data ..."

		unlink "/data/db/mongod.lock"

		setuser mongodb "$@" --dbpath /data/db --repair
	fi

	rm -rf "/data/db/journal/*"

	echo "Running mongodb ..."

	exec setuser mongodb "$@" --dbpath /data/db
fi

exec "$@"