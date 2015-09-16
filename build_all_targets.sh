#!/bin/bash
set -e

cat .travis.yml|grep 'TARGET='|sed 's/[ ]*-[ ]*//'|while read line ; do
  echo "building $line"
  eval $line make
done

