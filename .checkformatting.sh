#!/bin/bash

TABS=$(grep -nRP '\t' --include=\*.{cc,c,h} src)

if [[ $TABS ]] ; then
    echo "Error: Tab characters found!"
    echo "$TABS"
    exit 1
fi

TRAILING_WHITESPACE=$(grep -nRP " +$" --include=\*.{cc,c,h} src)

if [[ $TRAILING_WHITESPACE ]] ; then
    echo "Error: Trailing whitespace found!"
    echo "$TRAILING_WHITESPACE"
    exit 1
fi
