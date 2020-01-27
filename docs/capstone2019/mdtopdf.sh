#!/bin/bash
shopt -s globstar dotglob
for f in **/*.md;

do
	filename="${f%.*}"	
	pandoc  $f --from=markdown \
		-V linkcolor:blue \
		-V geometry:a4paper \
		-V geometry:margin=2cm \
		-V mainfont="DejaVu Serif" \
		-V monofont="DejaVu Sans Mono" \
		--latex-engine=lualatex \
		-o $filename.pdf	
done


