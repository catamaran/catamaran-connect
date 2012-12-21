# verify environment
if [ ! -d "$CAT_TOMCAT_ROOT" ]
then
  echo "Environment not initialized, run 'source initenv' in this Terminal window first."
  exit 1
fi

$CAT_TOMCAT_ROOT/bin/catalina.sh stop

