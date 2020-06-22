#!/bin/bash

docker build . -t base-php
docker run --rm --entrypoint '/bin/sh' -v ${PWD}:/tmp base-php -c '\
  apk info -v | sort > /tmp/package_versions.txt && \
  chmod 777 /tmp/package_versions.txt'
