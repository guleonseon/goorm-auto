#!/bin/bash

###########################################################
###		This is a services script		###
###########################################################

LOCAL=$HOME/.goorm

if [[ ! -d $LOCAL/log ]]
then
  mkdir $LOCAL/log
fi

#v2ray server service
v2rayServer() {
  LOG=$LOCAL/log/v2ray-server.log
  rm $LOG 2>/dev/null
  PID=`ps aux |grep "v2ray-server"| awk '{print $2}'`
  if [[ $PID != ""  ]]
  then
    kill -9 $PID > /dev/null 2>&1
    sleep 1
  fi
  nohup  $LOCAL/bin/v2ray/v2ray -config $LOCAL/etc/v2ray/v2ray-server.json > $LOG 2>&1 & 
}

v2rayServer
