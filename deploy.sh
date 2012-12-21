#!/bin/bash

TARGET_WEBAPPS_DIR=/catamaran/tomcat/connectapps

if [ -z $1 ]; then 	# -n tests to see if the argument is non empty
	echo "Missing target host argument"
        exit 1
fi

echo "stop local server if it's running"
./stop.sh

echo "clean local directories the right way so that symlinks are removed"
./clean_local.sh

echo "build a war"
mvn compile war:war

echo "copy the war to $1:$TARGET_WEBAPPS_DIR/"
scp target/*.war $1:$TARGET_WEBAPPS_DIR/

echo "clean local system again"
./clean_local.sh

echo "build local system with symlinks"
./build_local.sh

echo "start local system"
./start.sh
