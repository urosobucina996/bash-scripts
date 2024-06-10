#!/usr/bin/bash
handle_error() {
    echo "An error occurred"
    # Additional error handling logic can be added here
    exit 1
}

# Set up a trap to catch errors and execute the handle_error function
trap 'handle_error' ERR

while true; do
    if [ ${1} ]; then
        ./${1}.sh 'into echo script';
    else
        echo 'No Argument';
    fi
    sleep 2;
done
