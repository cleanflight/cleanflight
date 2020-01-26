#!/bin/bash
FILES=./*.md
FILES1=./SPI_HiFive/*.md
FILES2=./weekly_progress_reports/*.md
for f in $FILES
do
	markdown-pdf $f
done

for f in $FILES1
do
	markdown-pdf $f
done

for f in $FILES2
do
	markdown-pdf $f
done
