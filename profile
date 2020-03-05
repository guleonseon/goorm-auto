##---------------我是分割线----------------##

rm README-cloudshell.txt 2>/dev/null

echo Starting Service ...
.goormide/service.sh

echo Checking IP address ...
CIP=`curl -s icanhazip.com`
FIP=`cat .ip 2>/dev/null`

sleep 1

if [[ $CIP == $FIP  ]];
then
	echo "IP no changes"
else
	echo "IP has changed"
	echo $CIP > .ip
fi

echo IP:$CIP

v2ray_pid=`pidof v2ray`

if [[ x$v2ray_pid != x ]]
then
  echo "Service Ready!"
else
  echo "兄弟，v2ray有问题"
fi

