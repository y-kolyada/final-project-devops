#!/bin/bash

APP_RUN=$1
APP=$2

if [[ ${APP_RUN} != "java -jar devopskb.jar" ]]; then
  APP_RUN="java -jar devopskb.jar"
fi	

echo "APP_RUN: ${APP_RUN}"
echo "APP: ${APP}"

apps=$(ps ax | grep "${APP_RUN}" | grep -wv "grep" | awk '{ print $1 }')
for app in ${apps}; do
  if [[ ${app} != "" ]]; then
    echo "Stop running app: ${app}"
    sudo kill -SIGKILL ${app}
  fi
done

sleep 1
