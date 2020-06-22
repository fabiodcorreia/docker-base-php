#!/bin/bash

INDEX=`curl -s localhost | grep "PHP 7.3.19 - phpinfo()" | wc -l`

if [ $INDEX != 1 ]; then
  echo "**** Index with PHP Info not found ****"
  exit 1
fi
