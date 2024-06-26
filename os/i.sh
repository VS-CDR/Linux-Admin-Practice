#!/bin/bash

grep -oE '\b[a-zA-Z]{4,}\b' /var/log/anaconda/syslog | tr '[:upper:]' '[:lower:]' | sort | uniq -c | sort -n | tail -n 1
