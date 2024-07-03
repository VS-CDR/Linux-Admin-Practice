#!/bin/bash

calc_var=1

(tail -f test_fifo) |
while true; do
	read LINE
	if [ "$LINE" = "+" ]; then
		arg=0
		read arg
		let "calc_var = $calc_var + arg"
		echo "$calc_var"
	elif [ "$LINE" = "*" ]; then
		arg=1
		read arg
		let "calc_var = $calc_var * arg"
		echo "$calc_var"
	else
		if [ "$LINE" = "QUIT" ]; then
			echo "Process is stopping"
		else
			echo "Incorrect input"
		fi
		killall tail
		kill -SIGTERM $(cat .pid)
		exit
	fi
done
