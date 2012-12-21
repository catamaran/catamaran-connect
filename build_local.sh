# Perform a maven webapp build BUT replace static web content with symlinks to the source SO THAT local file changes appear immediately

TARGET_WEBAPP=catamaran-connect

# First remove old symlinks
rm target/$TARGET_WEBAPP/WEB-INF/freemarker-www
rm target/$TARGET_WEBAPP/static/css
rm target/$TARGET_WEBAPP/static/js
rm target/$TARGET_WEBAPP/static/img

# Then build which will move files from src/ to target/
mvn compile war:exploded

# Remove newly copied static files from target/
rm -r target/$TARGET_WEBAPP/WEB-INF/freemarker-www
rm -r target/$TARGET_WEBAPP/static/css
rm -r target/$TARGET_WEBAPP/static/js
rm -r target/$TARGET_WEBAPP/static/img

# Re-create the symlinks
pushd .
cd target/$TARGET_WEBAPP/WEB-INF/
ln -s ../../../src/main/webapp/WEB-INF/freemarker-www/ freemarker-www
mkdir -p ../static
cd ../static
ln -s ../../../src/main/webapp/static/css/ css
ln -s ../../../src/main/webapp/static/js/ js
ln -s ../../../src/main/webapp/static/img img
popd
