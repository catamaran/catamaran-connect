#!/bin/bash

TARGET_WEBAPP=/catamaran/tomcat/connectapps/ROOT

if [ -z $1 ]; then 	# -n tests to see if the argument is non empty
	echo "Missing target host argument"
        exit 1
fi

echo "copy webcode to $1:$TARGET_WEBAPP/"
rsync -e ssh -rcav src/main/webapp/* $1:$TARGET_WEBAPP/

echo "sync complete"
