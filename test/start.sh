#!/bin/bash

pip install -r ./test/requirements.txt

IP=`ping base_php_test -c 1 -s 16 | grep -o '([^ ]*' | grep -m1 "" | grep -o '([^ ]*' | tr -d '(:)'`

echo "base_php_test = $IP"

APP_TEST_URL="http://$IP"
APP_TEST_PORT="80"

python ./test/main.py $APP_TEST_URL $APP_TEST_PORT
