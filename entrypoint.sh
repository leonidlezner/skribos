#!/bin/sh -l

CONTAINER_VERSION=$(cat /VERSION)
export BUILD_DIR=${1:-dist}
export BUILD_ENV=${3:-server}

export LC_ALL=C.UTF-8
export LANG=C.UTF-8

echo "Skribos Container $CONTAINER_VERSION"
echo "BUILD_DIR: $BUILD_DIR"

exec "$@"