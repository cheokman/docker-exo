FROM exoplatform/ubuntu-jdk7:7u71
MAINTAINER Ben Wu <wucheokman@gmail.com>

ENV EXO_PLATFORM Platform4.3  
ENV EXO_VERSION 4.3.0-RC1
ENV EXO_EDITION community
ENV MYSQL_DRIVER_VERSION 5.1.35

ENV EXO_APP_DIR   /opt/exo
ENV EXO_DATA_DIR  /srv/exo
ENV EXO_LOG_DIR   /var/log/exo
ENV EXO_TMP_DIR   /tmp/exo-tmp

ENV DOWNLOAD_DIR /srv/downloads

ENV EXO_USER exo
ENV EXO_GROUP ${EXO_USER}

# add our user and group first to make sure their IDs get assigned consistently, regardless of whatever dependencies get added
RUN useradd --create-home --user-group --shell /bin/bash ${EXO_USER}

# Install some useful or needed tools
RUN apt-get -qq update && \
  apt-get -qq -y upgrade && \
  apt-get -qq -y install libreoffice-calc libreoffice-draw libreoffice-impress libreoffice-math libreoffice-writer && \
  apt-get -qq -y autoremove && \
  apt-get -qq -y autoclean

ADD container /
#RUN /build_script/setup.sh
# Create needed directories
#RUN mkdir -p ${EXO_APP_DIR}
#RUN mkdir -p ${EXO_DATA_DIR}  && chown ${EXO_USER}:${EXO_GROUP} ${EXO_DATA_DIR}
#RUN mkdir -p ${EXO_TMP_DIR}   && chown ${EXO_USER}:${EXO_GROUP} ${EXO_TMP_DIR}
#RUN mkdir -p ${EXO_LOG_DIR}   && chown ${EXO_USER}:${EXO_GROUP} ${EXO_LOG_DIR}

# Install eXo Platform
#RUN curl -L -o /srv/downloads/eXo-Platform-${EXO_EDITION}-${EXO_VERSION}.zip http://sourceforge.net/projects/exo/files/Platform4.2/eXo-Platform-${EXO_EDITION}-${EXO_VERSION}.zip/download && \
#    unzip -q /srv/downloads/eXo-Platform-${EXO_EDITION}-${EXO_VERSION}.zip -d ${EXO_APP_DIR} && \
#    rm -f /srv/downloads/eXo-Platform-${EXO_EDITION}-${EXO_VERSION}.zip && \
#    ln -s ${EXO_APP_DIR}/platform-${EXO_EDITION}-${EXO_VERSION} ${EXO_APP_DIR}/current

#Add mysql JDBC driver
#RUN curl -L -o /srv/downloads/mysql-jdbc-${MYSQL_DRIVER_VERSION}.zip https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-${MYSQL_DRIVER_VERSION}.zip && \
#	unzip -q /srv/downloads/mysql-jdbc-${MYSQL_DRIVER_VERSION}.zip -d /srv/ && \
#	cp /srv/mysql-connector-java-${MYSQL_DRIVER_VERSION}/mysql-connector-java-${MYSQL_DRIVER_VERSION}-bin.jar ${EXO_APP_DIR}/current/lib/

#COPY server.xml ${EXO_APP_DIR}/current/conf/server.xml

#RUN echo "JAVA_OPTS=\"-Dmysql.database=\$MYSQL_DATABASE -Dmysql.user=\$MYSQL_USER -Dmysql.password=\$MYSQL_PASSWORD \$JAVA_OPTS\"" >> ${EXO_APP_DIR}/current/bin/setenv.sh && \
#        rm -rf ${EXO_APP_DIR}/current/logs && ln -s ${EXO_LOG_DIR} ${EXO_APP_DIR}/current/logs && \
#        chown -R ${EXO_USER}:${EXO_GROUP} ${EXO_APP_DIR}/current/

EXPOSE 8080
# FIXME : replace "exo" by ${EXO_USER} when https://github.com/docker/docker/issues/4909 will be fixed.
#USER exo
#CMD ${EXO_APP_DIR}/current/start_eXo.sh --data ${EXO_DATA_DIR}
