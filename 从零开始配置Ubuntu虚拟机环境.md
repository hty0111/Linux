# 从零开始配置Ubuntu虚拟机环境

*2022.7.15*    *by HTY*

## Ubuntu系统安装

### VMware安装

官网：https://www.vmware.com/

### 下载镜像

镜像：https://launchpad.net/ubuntu/+cdmirrors

参考：https://baijiahao.baidu.com/s?id=1730906316257453037&wfr=spider&for=pc

### 安装

参考：https://blog.csdn.net/Thousand_drive/article/details/124349178



## 基本配置

### 换源

参考：https://blog.csdn.net/frighting_ing/article/details/122688413

### 输入法

#### Intelligent pinyin

==强烈推荐==
参考：https://zhuanlan.zhihu.com/p/527602728

#### fcitx-table

参考：https://blog.csdn.net/u013819452/article/details/125324881

#### 搜狗拼音

参考：https://blog.csdn.net/weixin_64684404/article/details/125461860

**添加时要把`only show current language`取消打勾**

### 网络工具

`sudo apt install net-tools`

### gcc/g++

`sudo apt install gcc/g++`

## 安装各类软件

### anaconda3

镜像：https://mirrors.tuna.tsinghua.edu.cn/anaconda/archive/
参考：https://blog.csdn.net/thy0000/article/details/122878599
不要装在`/opt`目录下，包管理时会出现权限问题，建议在主目录下新建Applications文件夹用于安装（matlab同理）

### typora

参考：https://blog.csdn.net/HandsomeHong/article/details/124648899

### vscode

官网：https://code.visualstudio.com/Download#
==千万别下系统自带的，不支持中文输入==

### Jetbrains全家桶（CLion为例）

参考：http://www.wjhsh.net/nanfengnan-p-14494716.html

#### 官网下载安装包

官网：https://www.jetbrains.com/clion/download/#section=linux

#### 解压

解压tar文件后，将文件夹移入`/opt/`目录下，改目录存放用户自行安装的软件

#### 配置环境变量

将启动文件命令写入`/usr/bin/clion`，**一定要把所有用户权限都+x**，`sudo chmod +x /usr/bin/clion`，运行`clion`测试

#### 配置快捷图标
`/usr/share/applications/clion.Desktop`文件夹下新建

#### 配置文件头部注释

File --> settings --> Editor --> File and Code Templates

##### python
python script
```python
#if ($HEADER_COMMENTS)
'''
Description: 
version: v1.0
Author: HTY
Date: ${YEAR}-${MONTH}-${DAY} ${HOUR}:${MINUTE}:${SECOND}
'''

#if ($ORGANIZATION_NAME and $ORGANIZATION_NAME != "")
# Copyright (c) $YEAR ${ORGANIZATION_NAME}#if (not $ORGANIZATION_NAME.endsWith(".")).#end All rights reserved.
#end
```

##### c/c++
includes/C Header File
```c
#if ($HEADER_COMMENTS)
/*
/* Description: 
/* version: v1.0
/* Author: HTY
/* Date: ${YEAR}-${MONTH}-${DAY} ${HOUR}:${MINUTE}:${SECOND}
*/

#if ($ORGANIZATION_NAME && $ORGANIZATION_NAME != "")
// Copyright (c) $YEAR ${ORGANIZATION_NAME}#if (!$ORGANIZATION_NAME.endsWith(".")).#end All rights reserved.
#end
```

### docker

#### docker engine

官网：https://docs.docker.com/engine/install/ubuntu/#set-up-the-repository
遇到报错：Got permission denied while trying to connect to the Docker daemon socket at...
参考：https://blog.csdn.net/u011337602/article/details/104541261/
测试：`docker version`

#### 配置镜像加速器

参考：https://blog.csdn.net/jiangyu1013/article/details/84339469

#### docker desktop

照着官网安装后会有一堆问题，不建议安装

### ROS2

官网：https://docs.ros.org/en/humble/Installation/Ubuntu-Install-Debians.html
也可参考 B站古月居《ROS2入门21讲》

