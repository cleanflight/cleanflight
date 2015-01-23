#!/bin/bash
echo $RUNTESTS
if [ $RUNTESTS ] ; then
	cd ./src/test && make test
else
	make -j2
fi
