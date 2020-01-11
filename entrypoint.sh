#!/bin/sh -l

BUILD_DIR=${1:-dist}
RECIPE=${2:-skribos.yml}
ENV=${3:-server}

echo "Output: $BUILD_DIR, Recipe: $RECIPE, Environment: $ENV"

mkdir -p $BUILD_DIR

if [ $ENV = "local" ];
then
    SUFFIX='--nodownload'
else
    SUFFIX=''
    echo "Updating Skribos CLI"
    git -C /usr/local/skribos-cli/ pull origin master    
fi

# Run Skribos
python3 /usr/local/skribos-cli/skribos.py --recipe $RECIPE --output $BUILD_DIR $SUFFIX