#!/bin/bash
#
BASE=/catamaran/servers/catamaran-connect
LIB=$BASE/tomcat/webapps/connect/WEB-INF/lib
CLASSES=$BASE/tomcat/webapps/connect/WEB-INF/classes
JAVA_BIN=/usr/bin

CLASSPATH=$(echo "$LIB"/*.jar | tr ' ' ':')

echo CLASSES: $CLASSES
CLASSPATH=$CLASSPATH:$CLASSES
echo Classpath: $CLASSPATH

mkdir -p ${BASE}/logs

# include this line below to enable remote debugging
#    -Xrunjdwp:transport=dt_socket,address=${DEBUG_PORT},server=y,suspend=n \

# production memory heap
# -Xms1024m -Xmx1024m

#
# Start the service in a JVM.
${JAVA_BIN}/java \
    -Xdebug \
    -Dlog4j.configuration=file:${BASE}/conf/csv.log4j.properties \
    -Djava.net.preferIPv4Stack=true \
    -classpath $CLASSPATH \
    org.catamarancode.connect.csv.GoogleContactsLoader \
    $1 

