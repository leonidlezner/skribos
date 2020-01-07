#!/bin/sh -l

ls -la

BUILD_DIR=$1
GH_PAT=$2

BRANCH_DIR="$BUILD_DIR/${GITHUB_REF:11}"

echo "Output dir: $1,  Branch dir: $BRANCH_DIR"

mkdir -p $BRANCH_DIR

cp -r ./src "$BRANCH_DIR"

list=`git tag --list 'v*'`

echo $list > $BUILD_DIR/versions.txt

echo $GH_PAT