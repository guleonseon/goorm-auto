##---------------我是分割线----------------##
export PATH=$HOME/.gcs/bin:$PATH

rm README-cloudshell.txt 2>/dev/null

echo Starting Service ...
.gcs/service.sh

echo Checking IP address ...
CIP=`curl -s icanhazip.com`
FIP=`cat .ip 2>/dev/null`


if [[ $CIP == $FIP  ]];
then
	echo "IP no changes"
else
	echo "IP has changed"
	echo $CIP > .ip
fi

echo IP:$CIP

frp_pid=`pidof frpc`
v2ray_pid=`pidof v2ray`

if [[ x$frp_pid != x && x$v2ray_pid != x ]]
then
  echo "Service Ready!"
elif [[ x$frp_pid == x ]]
then
  echo "兄弟，frp有问题"
elif [[ x$v2ray_pid == x ]]
then
  echo "兄弟，v2ray有问题"
fi

