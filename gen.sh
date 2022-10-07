#!/bin/bash
# Script used to generate packages using the fpm utility
# The stdin $1 argument is the version number, passed as './gen.sh n.x', n.x being the version number.

#Variables sourcing
#Automatically export all variables
set -a
source .env
set +a

fpm -s dir -t deb -p $NAME-$1-any.deb \
	--name $NAME \
	--license $LICENSE \
	--version $1 \
	--architecture all \
	--depends apt-transport-https \
    --depends curl \
	--description "Numigi installation script for Brave Browser. Fetches from brave.com" \
	--url "$URL" \
	--maintainer "$MAINTAINER" \
	--after-install install-hook
    