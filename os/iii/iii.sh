#!/bin/bash

lower_bound=10
upper_bound=20

while true; do
    workload=$(top -b -n 2 -d 0.2 -p $1 | tail -1 | awk '{print int($9)}')
    if [ "$workload" -gt "$upper_bound" ]; then
	renice -n 19 -p $1
	# kill -CONT $1
    elif [ "$workload" -lt "$lower_bound" ]; then
	renice -n -20 -p $1
	# kill -STOP $1
    fi
done
