#!/bin/bash

if [[ $# > 1 ]]; then
	PORT=$1
else
	PORT="/dev/ttyUSB0"
fi

echo "Starting dump on port $PORT."

cat <<EOF > $PORT
profile 0
EOF

sleep 1s

cat <<EOF > $PORT
rateprofile 0
dump
profile 1
EOF

sleep 1s

cat <<EOF > $PORT
dump profile
profile 2
EOF

sleep 1s

cat <<EOF > $PORT
dump profile
rateprofile 1
dump rates
rateprofile 2
dump rates
rateprofile 0
profile 0
EOF

echo "Dump done, grab your output from the cleanflight configurator CLI tab..."
