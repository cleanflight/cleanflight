#!/bin/bash
FILES=./*.md
for f in $FILES
do
	markdown-pdf $f
done
