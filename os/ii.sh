#!/bin/bash

echo "$$"

ps aux | awk -F ' ' '{print $2, $9}' | grep -v "$$" | sort -nk1 | tail -n 1
