#!/bin/bash

GOVERSION=${1}
if [ -z "${GOVERSION}" ]; then
	GOVERSION=1.11.1
fi

if [ -d ${HOME}/.go/${GOVERSION} ]; then
	echo "go ${GOVERSION} is already installed."
	exit 1
fi

rm -rf ${GOHOME}/pkg
mkdir -p ${HOME}/.go/${GOVERSION}
curl https://storage.googleapis.com/golang/go${GOVERSION}.darwin-amd64.tar.gz \
	| tar xvzf - -C ${HOME}/.go/${GOVERSION}/ --strip-components=1
echo $GOVERSION > ${HOME}/.go/.goversion

