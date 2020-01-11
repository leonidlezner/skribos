#!/bin/sh -l

FULLVERSION=`git describe`

echo ${FULLVERSION:1} > VERSION