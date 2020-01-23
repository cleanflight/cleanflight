#!/bin/bash
FILES=./*
for f in $FILES
do
	markdown-pdf $f
done
