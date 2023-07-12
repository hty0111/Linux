# 从零开始配置Ubuntu（虚拟机）环境

*2022.7.15  2022.12.8  by HTY*



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

### 有线网

==TODO==

### gcc/g++

`sudo apt install gcc/g++`

### cmake

apt自带版本过低，建议官网安装
官网：https://cmake.org/download/
参考：https://www.xtuos.com/6120.html
参考：https://blog.csdn.net/Man_1man/article/details/126467371



## 安装各类软件

### utools

官网：https://u.tools

参考：https://yuanliao.info/d/4672-ubuntuutools

### chrome

官网：https://www.google.cn/intl/zh-CN/chrome/

### glados

参考：https://www.jianshu.com/p/02e3e8ccfe80

官网：https://glados.rocks/console

### v2ray

官网：https://github.com/v2ray/v2ray-core/releases

### git

参考：https://www.liaoxuefeng.com/wiki/896043488029600/896954117292416

### anaconda3

镜像：https://mirrors.tuna.tsinghua.edu.cn/anaconda/archive/
参考：https://blog.csdn.net/thy0000/article/details/122878599
不要装在`/opt`目录下，包管理时会出现权限问题，可以装在默认路径下，或在主目录下新建Applications文件夹（matlab同理）

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

解压tar文件后，将文件夹移入`/opt/`目录下，该目录存放用户自行安装的软件

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
"""
Description: 
version: v1.0
Author: HTY
Date: ${YEAR}-${MONTH}-${DAY} ${HOUR}:${MINUTE}:${SECOND}
"""

#if ($ORGANIZATION_NAME and $ORGANIZATION_NAME != "")
# Copyright (c) $YEAR ${ORGANIZATION_NAME}#if (not $ORGANIZATION_NAME.endsWith(".")).#end All rights reserved.
#end

if __name__ == "__main__":

#end
```

##### c/c++
includes/C Header File
```c
#if ($HEADER_COMMENTS)
/**
 * Description: 
 * version: v1.0
 * Author: HTY
 * Date: ${YEAR}-${MONTH}-${DAY} ${HOUR}:${MINUTE}:${SECOND}
 */

#if ($ORGANIZATION_NAME && $ORGANIZATION_NAME != "")
// Copyright (c) $YEAR ${ORGANIZATION_NAME}#if (!$ORGANIZATION_NAME.endsWith(".")).#end All rights reserved.
#end

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

### ROS

官网：https://ros.org/blog/getting-started

ROS1：https://wiki.ros.org/noetic/Installation/Ubuntu

ROS2：https://docs.ros.org/en/humble/Installation/Ubuntu-Install-Debians.html
也可参考 B站古月居《ROS2入门21讲》

### matlab

浙大软件服务中心：https://ms.zju.edu.cn

挂载镜像：`sudo mount -o loop <file>.ios <dst>`或右击挂载

装在默认路径下需要改权限，可以选择装在主目录下

安装默认路径：http://t.zoukankan.com/smartmsl-p-8807442.html

配置桌面图标：https://www.cnblogs.com/lvchaoshun/p/9746155.html#

配置环境变量： `export PATH=$HOME/Applications/MATLAB/R2021b/bin:$PATH`

### GPU

官网：https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html

参考：https://blog.csdn.net/Raink_LH/article/details/109595717

参考：https://blog.csdn.net/wjinjie/article/details/108997692

### LaTex

参考：https://blog.csdn.net/qq_41814939/article/details/82288145

### Zotero

参考：https://blog.csdn.net/qq_43202953/article/details/108316527
参考：https://www.cc98.org/topic/4969029

### 向日葵
