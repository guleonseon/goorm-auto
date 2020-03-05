#!/bin/bash


USER=`whoami`

#彩色的看着舒服点
red() {
  echo -e "\033[31m$1\033[0m \c"
}

green() {
  echo -e "\033[32m$1\033[0m \c"
}

blue() {
  echo -e "\033[34m$1\033[0m \c"
}

blue "### Welcome to Google Cloud Shell Auto Deploy Script ###";echo
green "FBI WARNING: 这只是个弱鸡脚本，高手勿喷哦~ -- By guleon.";echo

red "几点提示:
1、这个脚本执行一次就行了，下次使用只需要登录shell就行，不怕重置
2、环境部署好之后，在系统/SwichyOmega 添加socks5代理就行
3、如果一点不懂linux的，建议先学学linux再玩
";echo

green "能行吗?[Y/n]："
read confirm

if [[ x$confirm == x || $confirm == "y" || $confirm == "Y" ]]
then
  green "好嘞 ...";echo
else
  red "拜拜了您嘞...";echo
  exit 0
fi

if [[ -d $HOME/.goormide ]]
then
  green "兄弟，老实交代是不是安装过了,要重新安装吗？[Y/n]"
  read confirm

  if [[ x$confirm == x || $confirm == "y" || $confirm == "Y" ]]
  then
    cd $HOME
    kill -9 `pidof v2ray` 2>/dev/null
    rm -fr .goormide goorm-auto 2>/dev/null
    mv .bashrc_bak .bashrc
  else
    green "拜拜";echo
    exit 0
  fi
fi

cd $HOME

blue "下载需要的东西 ...";echo

git clone https://github.com/guleonseon/goorm-auto.git

sleep 1

blue "正在配置环境... ";echo

if [[ -f $HOME/.bashrc ]]
then
  cp $HOME/.bashrc $HOME/.bashrc_bak
fi

#copy .goormide to $HOME
cp -r goorm-auto/.goormide $HOME

#配置自动运行
cat goormide-auto/profile >> .bashrc

.goormide/service.sh

sleep 2

v2ray_pid=`pidof v2ray`

if [[ x$v2ray_pid == x ]]
then
  red "糟糕，我有种不详的预感，自己找找原因，咱先撤了！";echo
else
  green "额...环境部署好了, Enjoy it!";echo
fi


