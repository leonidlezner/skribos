#!/bin/sh -l

BUILD_DIR=$1
GH_PAT=$2
BRANCH_DIR="$BUILD_DIR/${GITHUB_REF:11}"
mkdir -p $BRANCH_DIR

# Update to the latest Skribos CLI
git -C /usr/local/skribos-cli/ pull origin master

# Run Skribos
python3 /usr/local/skribos-cli/skribos.py --recipe skribos.yml --output=$BRANCH_DIR
