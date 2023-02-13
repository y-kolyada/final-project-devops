#!/bin/bash

APP_RUN=$1
PROJECT_PATH=$2
MAIN_CLASS=$3
PAUSE=5

[ -z ${APP_RUN} ]; APP_RUN="java -jar devopskb.jar"
[ -z ${PROJECT_PATH} ]; PROJECT_PATH="/home/devops/dev/devopskb"
[ -z ${MAIN_CLASS} ]; MAIN_CLASS="link.kolyada.devops.devopskb.DevopskbApplication"

echo "APP_RUN: ${APP_RUN}"
echo "PROJECT_PATH: ${PROJECT_PATH}"
echo "MAIN_CLASS: ${MAIN_CLASS}"

cd ${PROJECT_PATH}/target
rm ../run_app.log > /dev/null 2>&1
echo "Run app <${APP_RUN}> ..."
#setsid -w ${APP_RUN} ${MAIN_CLASS} > ../run_app.log & 
sudo nohup ${APP_RUN} ${MAIN_CLASS} > ../log/jenkins_runapp_localdev.log 2> ../log/jenkins_runapp_localdev_errors.log < /dev/null &
sleep ${PAUSE}
cat ../run_app.log

app=$(ps ax | grep -m1 "${APP_RUN}" | grep -wv "grep" |  awk '{ print $1 }')
if [[ ${app} != "" ]]; then
  #echo "Running app PID: ${app}"
  sudo kill -SIGKILL ${app}
fi

apps=$(ps ax | grep "${APP_RUN}" | grep -wv "grep" | awk '{ print $1 }')
for app in ${apps}; do
  if [[ ${app} != "" ]]; then
     echo "Running app PID: ${app}"
  fi
done
