#!/bin/bash

echo "Updating SDK references for new MacOSX SDK"

FILE='$1'

if [ -e "$FILE" ]
then 

    if [ "$FILE" == "^Makefile$" ]
    then
        sed -i 's/MacOSX.sdk/MacOSX10.*.sdk/g' $FILE
    else
        echo "This script only works with Makefiles"
    fi
fi
