#!/bin/bash
shopt -s globstar dotglob
for f in **/*.md;

do
	filename="${f%.*}"	
	pandoc $f -V geometry:margin=1in --latex-engine=lualatex -o $filename.pdf
done


