#!/bin/bash

# Create needed directories
mkdir -p $EXO_APP_DIR
mkdir -p $EXO_DATA_DIR  && chown $EXO_USER:$EXO_GROUP $EXO_DATA_DIR
mkdir -p $EXO_TMP_DIR   && chown $EXO_USER:$EXO_GROUP $EXO_TMP_DIR
mkdir -p $EXO_LOG_DIR   && chown $EXO_USER:$EXO_GROUP $EXO_LOG_DIR

curl -L -o $DOWNLOAD_DIR/eXo-Platform-$EXO_EDITION-$EXO_VERSION.zip http://sourceforge.net/projects/exo/files/$EXO_PLATFORM/eXo-platform-$EXO_EDITION-$EXO_VERSION.zip/download
unzip -q /srv/downloads/eXo-Platform-$EXO_EDITION-$EXO_VERSION.zip -d $EXO_APP_DIR
rm -f /srv/downloads/eXo-Platform-$EXO_EDITION-$EXO_VERSION.zip
mv $EXO_APP_DIR/platform-$EXO_EDITION-$EXO_VERSION-1 $EXO_APP_DIR/platform-$EXO_EDITION-$EXO_VERSION
ln -s $EXO_APP_DIR/platform-$EXO_EDITION-$EXO_VERSION $EXO_APP_DIR/current

curl -L -o $DOWNLOAD_DIR/mysql-jdbc-$MYSQL_DRIVER_VERSION.zip https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-$MYSQL_DRIVER_VERSION.zip
unzip -q $DOWNLOAD_DIR/mysql-jdbc-$MYSQL_DRIVER_VERSION.zip -d /srv/
cp /srv/mysql-connector-java-$MYSQL_DRIVER_VERSION/mysql-connector-java-$MYSQL_DRIVER_VERSION-bin.jar $EXO_APP_DIR/current/lib/
echo "JAVA_OPTS=\"-Dmysql.database=\$MYSQL_DATABASE -Dmysql.user=\$MYSQL_USER -Dmysql.password=\$MYSQL_PASSWORD \$JAVA_OPTS\"" >> $EXO_APP_DIR/current/bin/setenv.sh
jar cf $EXO_APP_DIR/current/webapps/ldap-extension.war /tmp/addons/ldap/war/WEB-INF/
jar cf $EXO_APP_DIR/current/lib/ldap-extension-config.jar /tmp/addons/ldap/jar/conf/
JAVA_OPTS="-Dldap.dns=\$LDAP_DNS -Dldap.host=\$LDAP_HOST -Dldap.port=\$LDAP_PORT -Dldap.account=\$LDAP_ACCOUNT -Dldap.password=\$LDAP_PASSWORD \$JAVA_OPTS\"" >> $EXO_APP_DIR/current/bin/setenv.sh 

rm -rf $EXO_APP_DIR/current/logs 
ln -s $EXO_LOG_DIR $EXO_APP_DIR/current/logs
chown -R $EXO_USER:$EXO_GROUP $EXO_APP_DIR/current/
