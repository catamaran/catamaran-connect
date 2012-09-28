#!/bin/bash

# verify environment
if [ ! -d "$CAT_TOMCAT_ROOT" ]
then  echo "Environment not initialized, run 'source initenv' in this Terminal window 
first."
  exit 1
fi

# define a tomcat webapp as a symlink back to this project's maven build (target)
# directory
if [ ! -d "$CAT_TOMCAT_CURRENT_WEBAPP" ]
then
  echo "Tomcat webapp $CAT_TOMCAT_CURRENT_WEBAPP not found, creating via symlink to $CAT_WORKING_DIR/target/$CAT_CURRENT_PROJECT now.."
  pushd $CAT_WORKING_DIR
  cd $CAT_TOMCAT_WEBAPPS
  ln -n -s $CAT_WORKING_DIR/target/$CAT_CURRENT_PROJECT $CAT_CURRENT_PROJECT
  popd
fi

# start tomcat with debugging enabled
$CAT_TOMCAT_ROOT/bin/catalina.sh jpda start
