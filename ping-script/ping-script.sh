#!/usr/bin/bash
##########
### Pass multiple argunests
echo $@
##########
### Loop to get all arguments from terminal
for arg in "$@"; do
    ping -c 2 $arg
done
