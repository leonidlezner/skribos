#!/bin/sh -l

BUILD_DIR=$1
GH_PAT=$2
BRANCH_DIR="$BUILD_DIR/${GITHUB_REF:11}"
SOURCE_DIR="src"
BOOK="lernOS-for-You-Guide-de.md"
METADATA="metadata.yaml"

mkdir -p $BRANCH_DIR

# Update to the latest Skribos CLI
git -C /usr/local/skribos-cli/ pull origin master

# Run Skribos
python3 /usr/local/skribos-cli/skribos.py --recipe skribos.yml

pandoc $SOURCE_DIR/$METADATA -s -o $BRANCH_DIR/lernOS-for-You-Guide-de.docx $SOURCE_DIR/$BOOK

#git tag --list 'v*' > $BUILD_DIR/versions.txt
