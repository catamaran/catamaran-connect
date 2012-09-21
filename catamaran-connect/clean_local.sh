
WEBAPP=catamaran-connect

# First remove symlinks
rm target/$WEBAPP/WEB-INF/freemarker-www
rm target/$WEBAPP/static/css
rm target/$WEBAPP/static/js
rm target/$WEBAPP/static/img

# Then clean
mvn clean

