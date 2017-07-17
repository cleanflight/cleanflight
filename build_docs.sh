#!/bin/bash

filename=Manual
doc_files=(
	'Introduction.md'
	'Getting Started.md'
	'Safety.md'
	'Installation.md'
	'Configuration.md'
	'Cli.md'
	'Serial.md'
	'Rx.md'
	'Spektrum bind.md'
	'Failsafe.md'
	'Battery.md'
	'Gps.md'
	'Rssi.md'
	'Telemetry.md'
	'LedStrip.md'
	'Display.md'
	'Buzzer.md'
	'Sonar.md'
	'Profiles.md'
	'Modes.md'
	'Inflight Adjustments.md'
	'Controls.md'
	'Blackbox.md'
	'Migrating from baseflight.md'
	'Boards.md'
	'Board - AlienFlight.md'
	'Board - CC3D.md'
	'Board - ChebuzzF3.md'
	'Board - CJMCU.md'
	'Board - ColibriRace.md'
	'Board - F3FC Racing.md'
	'Board - MotoLab.md'
    'Board - Naze32.md'
    'Board - Paris Air Hero 32.md'
    'Board - RMDO.md'
    'Board - Sparky.md'
    'Board - SPRacingF3.md'
    'Board - SPRacingF3EVO.md'
    'Board - SPRacingF3MINI.md'
    'Board - SPRacingF3NEO.md'
)

if which markdown-pdf >/dev/null; then
	echo "Building ${filename}.pdf"

	rm -f "obj/${filename}.md"
	for i in "${doc_files[@]}"
	do
		cat "docs/$i" >> "obj/${filename}.md"
	done
	rm -f "obj/${filename}.pdf"

	markdown-pdf -c docs "obj/${filename}.md"

else
	echo -e "\nFAILED"
	echo "Install markdown-pdf to build the PDF documentation"
	exit 1
fi
