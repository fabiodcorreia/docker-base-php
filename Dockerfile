FROM fabiodcorreia/base-alpine:1.0.1

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="fabiodcorreia"

RUN \
  echo "**** install runtime packages ****" && \
    apk add --no-cache \
      curl \
      nginx \
      php7 \
      php7-fileinfo \
      php7-fpm  \
      php7-json \
      php7-mbstring \
      php7-openssl \
      php7-session \
      php7-simplexml \
      php7-xml \
      php7-xmlwriter \
      php7-zlib && \
  echo "**** configure nginx ****" && \
    echo 'fastcgi_param  SCRIPT_FILENAME $document_root$fastcgi_script_name;' >> /etc/nginx/fastcgi_params && \
    rm -f /etc/nginx/conf.d/default.conf && \
  echo "**** cleanup ****" && \
  rm -rf \
	  /tmp/* \
	  /var/tmp/*

# add local files
COPY root/ /

# ports
EXPOSE 80

# volumes
VOLUME /config
