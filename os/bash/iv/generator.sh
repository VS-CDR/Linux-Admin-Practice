#!/bin/bash

echo $$ > .pid

while true; do
	read LINE
	echo "$LINE" > test_fifo
done
