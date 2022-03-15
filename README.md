# Linux命令行与Shell脚本编程大全

1-18章 2022.2.1

### 二、走进shell

#### 2.2 通过linux控制台终端访问CLI

```shell
setterm -inversescreen on/off	#交换背景和前景颜色
setterm -background/foreground white/black	#修改背景和前景颜色
setterm -reset	#复原
setterm -store	#将当前设置保存为reset
```

### 三、基本的bash shell命令

#### 3.3 bash手册

```shell
man <cmd>	#查看具体命令的手册
man -k <keyword>	#查看相关的命令
man <num> <cmd>		#查看对应部分
<cmd> -help/--help
info <cmd>
```

#### 3.5 文件和目录列表

```shell
ls -Rdi	#递归显示子目录+只显示目录+查看inode编号
ll=ls -alF	#显示隐藏文件+长列表+区分文件和目录
ls --time=atime		#显示访问时间而非修改时间
ls [ai]/[a-i]/[!a]	#匹配特定字符
```

#### 3.6 处理文件

```shell
touch -a	#只改变访问时间而非修改时间
cp -Ri <src> <file/dir>	#递归复制整个目录+询问是否覆盖
ln -s <file1> <file2>	#符号链接/软链接，file2->file1，相当于快捷方式
ln <file1> <file2>		#硬链接，同一文件，保持同步
readlink -f <file>	#显示最终链接
mv <file> <name>	#更改文件名
mv <file/dir> <dir>		#更改文件位置
rm -rf <file>	#递归+强制
```

#### 3.7 处理目录

```shell
mkdir -p <dir/dir>	#创建子目录
rmdir <dir>		#删除空目录
tree		#树状显示当前目录
```

#### 3.8 查看文件内容

```shell
file <file>	#查看文件的详细信息
cat/more/less <file>	#查看内容
head/tail -n 2 <file>	#查看开头/最后两行
tail -f <file>	#实时检测
```

### 四、更多的bash shell命令

#### 4.1 检测程序

```shell
ps -efl --forest	#全部进程+完整格式+长列表+层级
top/htop		#显示实时进程
kill <PID>		#终止进程
killall <name>
```

#### 4.2 监测磁盘空间

```shell
mount -t <type> <device> <dir>	#手动挂载
#  mount -t vfat /dev/sdb1 /media/disk		#以Windows长文件系统挂载U盘
umount <dev>/<dir>	#卸载
df -h	#显示磁盘情况
du -chs	#当前目录的磁盘情况，所有已列出文件大小+易读+每个输出的总计
```

#### 4.3 处理数据文件

```shell
sort -t <'char'> -k <pos> -nr <file>	#按指定字段分隔+指定排序字段+按数字排序+降序
grep -vncre <content> <file>	#反向搜索+显示行号+只显示匹配行数+递归+多个匹配模式
gzip <file>		<#查看压缩的文件内容
gzip -d / gunzip <file.gz>	#解压缩
tar -czvf <file.tar.gz/file.tgz> <src>	#创建归档文件+使用gzip压缩+处理时显示文件+输出结果到文件
tar -tf <file.tar>	#列出文件，但不提取
tar -zxvf <file.tgz/file.tar.gz>	#重定向给gzip+解压+显示+输出到文件
```

### 五、理解shell

#### 5.2 shell的父子关系

```shell
bash/exit	#生成/退出子shell
(<cmd>; (<cmd>))	#进程列表，生成多个子shell执行对应命令
echo $BASH_SUBSHELL	#使用环境变量查看有几个子shell
sleep <sec>&		#睡眠一定秒数+后台进程
jobs -l	#显示后台信息+PID
coproc <name> { <cmd>; } <redirec>	#使用协程并命名，支持双向管道
coproc (<cmd>; <cmd>)	#协程+进程列表
```

#### 5.3 理解shell的内建命令

```shell
type -a / which <cmd>		#查看命令位置
history | tail -n 10	#查看历史命令+重定向查看最近10条
history -a	#写入.bash_history(否则保留在内存中，退出bash时才写入)
!id		#执行对应的历史命令
alias [alias]='cmd'	#取别名
alias -p	#查看可用别名
```

### 六、使用Linux环境变量

#### 6.1 什么是环境变量

```shell
env/printenv	#查看全局变量
printenv <var> / echo $<var>	#使用全局变量的值
set		#查看局部变量、全局变量、用户定义变量
```

#### 6.2 设置用户定义变量

```shell
<var>="cmd"; export <var>	#创建局部变量+导入全局变量
```

#### 6.3 删除环境变量

```shell
unset <var>	#删除环境变量
```

#### 6.5 设置PATH环境变量

```shell
export PATH="$PATH:<dir>"	#目录之间冒号分隔，退出系统后不保存
```

#### 6.6 定位系统环境变量

```shell
/etc/ptofile.d/**.sh	# 所有用户的环境变量
$HOME/.bashrc	#个人用户的环境变量
```

#### 6.7 数组变量

```shell
<var>=(one twe three)	#给某个环境变量设置多个值，数组
echo $<var>				#显示数组的第0个值
echo ${<var>[n]}		#显示第n个值
echo ${<var>[*]}		#显示整个数组
unset <var>/<var>[n]	#删除整个数组或某个值
```

### 七、理解Linux文件权限

#### 7.1 Linux的安全性

```shell
useradd -m <username>	#添加新用户+创建home目录
userdel	-r	#删除用户+删除home目录
usermod	-lpLU	#修改用户名+修改密码+锁定+解锁
passwd <user>	#修改密码
chpasswd < <user:pwd>	#可以用文件重定向修改大量密码
```

#### 7.2 使用Linux组

```shell
groupadd	#创建新组
usermod -G <group> <user>	#添加用户到组
groupmod -gn	#修改GID+修改组名
```

#### 7.3 理解文件权限

```shell
umask <mode>	#修改默认权限，需要使用掩码
```

#### 7.4 改变安全性设置

```shell
chmod <ugoa> <+-=> / <mode> <file>	#修改文件权限
chown <user/UID.group> -Rh <file>	#改变属主和属组+递归+符号链接
chgrp <group> <file>	#改变默认属组
```

### 九、安装软件程序

#### 9.2 基于Debian的系统

```shell
dpkg -ilrPV <pkg>	#安装+查找+移除+彻底删除+核验，用于.deb文件
aptitude show/search/install/remove/purge <pkg>
```

#### 9.3 基于Red Hat的系统

```shell
yum list installed/update
yum provides/install/remove/erase/update <pkg>	#查找包的归属+安装+删除+彻底删除+更新
yum localinstall <pkg.rpm>	#本地安装
yum clean all; yum deplist <pkg>; yum update --skip-broken	#处理包依赖关系
```

#### 9.4 从源码安装

```shell
tar -zxvf <file.tgz>; cd <dir>; ./configure; make; make install		#解压+配置+编译+安装 
```

### 十、使用编辑器

#### 10.1 vim编辑器

| 正常模式 |                       |              |                      |
| -------- | --------------------- | ------------ | -------------------- |
| i / esc  | 插入模式（编辑）/退出 | :            | 命令行模式           |
| x=delete | 删除当前字符          | dd           | 删除当前行           |
| dw       | 删除当前单词          | d$           | 删除当前位置到行尾   |
| J        | 删除换行符            | u            | 撤销                 |
| a        | 光标后追加数据        | A            | 光标所在行末追加数据 |
| r char | 替换当前字符          | R text     | 覆盖数据             |
| y        | 复制                  | p            | 粘贴                 |
| v        | 可视模式，用于复制    | / text + n | 查找                 |

| 命令行模式     |                 |                   |             |
| -------------- | --------------- | ----------------- | ----------- |
| q              | 未修改          | q!                | 取消修改    |
| wq             | 保存到当前文件  | q <file>          | 另存为      |
| :s/old/new | 替换第一个[old] | :%s/old/new/g | 替换所有old |

### 十一、构建基本脚本

#### 11.2 创建shell脚本文件

```shell
#!/bin/bash		#文件第一行指定使用的shell
```

#### 11.3 显示消息

```shell
echo -ne 	#输出命令后不换行+允许转义符
```

#### 11.4 使用变量

```shell
var=`cmd`/$(cmd)	#获得命令行的输出，使用变量前要$
```

#### 11.5 重定向输入和输出

```shell
cmd >/>> file	#命令的输出重定向到文件 覆盖/追加
cmd < file		#文件的内容重定向到输入
cmd << marker	#内联重定向，无需文件作为输入
    data
    marker	#指定一个文本标记划分输入的开始和结尾
```

#### 11.6 管道

```shell
cmd1 | cmd2		#将命令1的输出传给命令2
```

#### 11.7 执行数学运算

```shell
expr	#处理简答的数学运算
var=$[operation]	#使用$[]
bc -q	#内置计算器，使用quit退出
	scale=num	#小数点后显示位数
	quit		#退出
var=$(echo "options; expressions" | bc)	#在脚本中使用bc
#在脚本中使用内联重定向进行大量计算
var=$(bc << EOF
    options
    statements
    expressions
    EOF
    )
```

#### 11.8 退出脚本

```shell
echo &?		#查看退出状态码
exit num	#在脚本结束时指定一个退出状态码
```

### 十二、使用结构化命令

#### 12.3 嵌套if

```shell
#if后命令的退出状态码为0则执行then后的语句，else属于距离最近的elif，fi为结束标志
if cmd1
then 
    cmds
elif cmd2
then 
    cmds
else
    cmds
fi
```

#### 12.4 test命令

```shell
if test cmd	#数值、字符串、文件的比较，只能处理整数
if [ cmd ]	#省略test，方括号中要有空格
-eq -ge -gt -le -lt -ne		#数值比较
= != \< \> -n -z	#字符串比较，比较大小需转义，按ASCII排序，与sort相反
-d -e -f -r -s -w -x -O -G -nt -ot	#文件比较，判断是否为目录等，比较新旧需确认文件存在
```

#### 12.5 复合条件测试

```shell
[ condition1 ] && [ condition2 ]	#AND
[ condition1 ] || [ condition2 ]	#OR
```

#### 12.6 if-then的高级特性

```shell
if ((3**2))		#实现高级数学表达式，无需转义
if [[$USER == r*]]	#模式匹配
```

#### 12.7 case命令

```shell
case var in
pattern1 | pattern2) cmds;;
pattern3) cmds;;
*) default cmds;;
esac
```

### 十三、更多的结构化命令

#### 13.1 for命令

```shell
#以空格、tab、换行分隔，用""包含分隔内容
for var in list
do
	cmds
done
IFS.OLD=$IFS	#保存默认的 internal filed seperator
IFS=$'\n;:'		#修改IFS
IFS=$IFS.OLD	#恢复默认的IFS
```

#### 13.2 C语言风格的for命令

```shell
for ((i = 0; i < 5; i++))
```

#### 13.3 while命令

```shell
while [ cmds ]
do
	cmds
done
```

#### 13.4 until命令

```shell
until [ cmds ]
do
	cmds
done
```

#### 13.7 控制循环

```shell
break n	#跳出n层循环
continue n
```

### 十四、处理用户输入

#### 14.1 命令行参数

```shell
-n "$1" ... $9 ${10} ${11}	#检查用户是否输入了参数
basename $0		#不含路径的脚本名
```

#### 14.2 特殊参数变量

```shell
$#	#参数数量
${!#}	#最后一个参数，无参数时为脚本名
$*	#把命令行参数当做一个整体
$@	#把命令行参数当做由单词组成的字符串，可遍历
```

#### 14.3 移动变量

```shell
shift n		#将命令行参数左移n个，$0不变
```

#### 14.4 处理选项

```shell
set -- $(getopt -q ab:cd "$@")	#命令行参数交给getopt格式化后由set设置，无法处理引号和空格
while getopts :ab:cd opt	#每次读取一个参数，$OPTIND增加1，$OPTARG保存内容，忽略'-'，
```

#### 14.6 获得用户输入

```shell
read -t5 -n1 -p "" -s var1 var2	#超时5s+只获取一个字符+显示信息+隐藏输入内容，默认放在$REPLY中
cat file | while read line	#用管道读取文件，默认一行为一个参数
```

### 十五、呈现数据

#### 15.1 理解输入和输出

```shell
1> file1 2>file2	#STDOUT重定向到file1，STDERR重定向到file2
&> file		#重定向到同一个文件
```

#### 15.2 在脚本中重定向输出

```shell
echo "" >&2		#临时重定向STDERR，配合命令行重定向到具体文件
exec 1>file		#永久重定向STDOUT到file
```

#### 15.3 在脚本中重定向输入

```shell
exec 0< file	#从文件重定向输入
```

#### 15.4 创建自己的重定向

```shell
exec 3>/>>file	#自定义重定向流和文件
	echo "" >&3
exec 3>&1		#创建临时重定向，保存标准重定向1的起始位置
	exec 1>file	#重定向1
	exec 1>&3	#复原1
exec 3>&-	#关闭重定向
```

#### 15.5 列出打开的文件描述符

```shell
lsof -a -p$$ -d0,1,2	#AND+指定PID+指定重定向编号，$$表示当前PID	
```

#### 15.6 阻止命令输出

```shell
> /dev/null		#null不会保存信息
/dev/null > file	#快速清空文件内容
```

#### 15.7 创建临时文件

```shell
mktemp -t -d file.XXXXXX	#shell会自动生成六个后缀，-t使文件在/tmp中，否则在当前目录下，-d创建临时目录
```

#### 15.8 记录消息

```shell
tee -a file	#同时发送给STDOUT和file+追加，默认会覆盖
```

### 十六、控制脚本

#### 16.1 处理信号

```shell
trap cmd SIGNAL		#捕获信号并执行命令
trap -/-- SIGNAL	#恢复默认
```

#### 16.3 在非控制台下运行脚本

```shell
nohup	#解除终端与进程的关联
```

#### 16.4 作业控制

```shell
bg 作业号	#以后台模式重启作业
fg 作业号	#以前台模式重启作业
```

#### 16.5 调整谦让度

```shell
nice -n 10	#修改优先级，默认为0，越高优先级越低
renice -n 10 -p PID	#修改已运行进程的优先级
```

#### 16.6 定时运行作业

```shell
at [-f file] time	#在指定时间执行文件
atq		#查看排队的任务
atrm 作业号  #删除任务
crontab -l	#列出时间表
```

### 十七、创建函数

#### 17.1 基本的脚本函数

```shell
name() / function name {cmd}	#创建函数
```

#### 17.2 返回值

```shell
$？		#用return返回，直接获取退出状态码
var=$(func)/`func`		#用echo返回，变量赋值
```

#### 17.3 在函数中使用变量

```shell
local var	#声明局部变量
```

#### 17.4 数组变量和函数

```shell
#命令行输入时候不要加()，用空格分隔，否则会被一起读取!!!
${array[*]}		#取数组全部元素
```

#### 17.6 创建库

```shell
source/. file	#dot operator，在当前shell中执行脚本，从而调用库函数
```

#### 17.7 在命令行上使用函数

```shell
function name { cmds; }		#要空格和分号
```

