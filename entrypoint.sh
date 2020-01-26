#!/bin/sh -l

CONTAINER_VERSION=$(cat /VERSION)
export BUILD_DIR=${2:-dist}
export BUILD_ENV=${3:-server}

export LC_ALL=C.UTF-8
export LANG=C.UTF-8

echo "Skribos Container $CONTAINER_VERSION"
echo "BUILD_DIR: $BUILD_DIR"

if [ ! -d "./external/skribos-cli" ]; then
  git clone https://github.com/leonidlezner/skribos-cli.git ./external/skribos-cli
fi

ln -s /data/external/skribos-cli/skribos_update.sh /usr/bin/skribos_update.sh
ln -s /data/external/skribos-cli/skribos_build.sh /usr/bin/skribos_build.sh

exec "$@"