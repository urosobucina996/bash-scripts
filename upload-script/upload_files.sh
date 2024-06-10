#!/bin/bash
# 1. Make list of non existing files in dest folder
# IMPORTANT FOR NOT GRAPHICAL ENVIROMENTS MAKE LOGS TO SEE ERRORS
#photo_source=********
destination=~/dest-photos/
if ! cd /media/serverside/STORE\ N\ GO/testCases/ 2> /dev/null; then
    echo -ne '\007'
    notify-send "No source found!"
    exit 1
fi

cd /media/serverside/STORE\ N\ GO/testCases/
FILES=$(diff <(ls .) <(ls -R $destination) | grep '<' | cut -c3-)
if [[ -z $FILES ]]
then
notify-send "No files to copy!"
exit 0
fi
new_folder_name=$destination$(date +"%d-%m-%Y")-photos
mkdir -p $new_folder_name
cp $FILES $new_folder_name
cd
#### IN THE END MAKE BEEP SOUND WHEH PROCESS IS FINALIZED ####
echo -ne '\007'
notify-send "Files transferred!"

