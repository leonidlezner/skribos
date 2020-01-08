#!/bin/sh -l

BUILD_DIR=$1
GH_PAT=$2
BRANCH_DIR="$BUILD_DIR/${GITHUB_REF:11}"

mkdir -p $BRANCH_DIR

pandoc src/metadata.yaml -s -o dist/lernOS-for-You-Guide-de.docx src/lernOS-for-You-Guide-de.md

#git tag --list 'v*' > $BUILD_DIR/versions.txt
