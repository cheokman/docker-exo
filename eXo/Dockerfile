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
RUN /build_script/setup.sh
EXPOSE 8080
# FIXME : replace "exo" by ${EXO_USER} when https://github.com/docker/docker/issues/4909 will be fixed.
USER exo
CMD ${EXO_APP_DIR}/current/start_eXo.sh --data ${EXO_DATA_DIR}
