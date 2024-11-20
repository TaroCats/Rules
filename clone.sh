#!/bin/bash
echo ""
#输出当前时间
date --date='0 days ago' "+%Y-%m-%d %H:%M:%S"
echo "Start"
#判断宝塔WebHook参数是否存在
#if [ ! -n "$1" ];
#then 
#  echo "param参数错误"
#  echo "End"
#  exit
#fi
#git项目路径
gitPath="/www/wwwroot/Files/Rules"
#git 网址
gitHttp="git@github.com:TaroCats/Rules.git"
echo "Web站点路径：$gitPath"
#判断项目路径是否存在
if [ -d "$gitPath" ]; then
  cd $gitPath
  #判断是否存在git目录
  if [ ! -d ".git" ]; then
    echo "在该目录下克隆 git"
    sudo git clone $gitHttp gittemp
    sudo mv gittemp/.git .
    sudo rm -rf gittemp
  fi
  #拉取最新的项目文件
  sudo git reset --hard origin/master
  sudo git pull
  #设置目录权限
  sudo chown -R www:www $gitPath
  echo "End"
  exit
else
  echo "该项目路径不存在"
  echo "End"
  exit
fi