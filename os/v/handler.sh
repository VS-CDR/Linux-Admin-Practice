#!/bin/bash

echo "$$" > .pid

var=1

add()
{
let "var = var + 2"
echo "$var"
}

mul()
{
let "var = var * 2"
echo "$var"
}

finish()
{
echo "Stopped by other process"
exit
}

trap 'add' USR1
trap 'mul' USR2
trap 'finish' TERM

while true; do
	echo "" > /dev/null
done
