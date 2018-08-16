# Getting Started

## 预修课程准备

1. 基本生物课程：    如《遗传学》和/或《分子生物学》
2. 基本统计课程：    如《概率论》和/或《生物统计》
3. 基本数学课程：    如《线性代数》
4. 基本计算机课程：如《C语言》

## Learning Materials

1. Tutorial 
   * **Basic Tutorial** \(this one\) 
   * [**Advanced Tutorial**](https://lulab.gitbook.io/training)  
2. [Github](https://github.com/lulab/Shared) for students \(shared code and scripts）

> see more learning materials in _Appendix I. Keep Learning_

## Virtual Machines

### VirtualBox

We provide a Linux virtual machine \(Download links: [TsinghuaCloud](https://cloud.tsinghua.edu.cn/d/08cb34ba57cf44b8aea9/) or [BaiduYun](https://pan.baidu.com/s/1ETkey)\), which has some bioinfo software pre-installed. You can download the file and open it with [**VirtualBox**](https://www.virtualbox.org/wiki/Downloads) in Windows or Mac.

### Docker \(Recommended\)

We provide a Linux docker, which is a modern solution of setting up a virtual Linux OS.

**I. 安装并运行docker程序：**

从[docker官网](https://www.docker.com/get-docker)下载Mac或Windows版本的docker程序，安装并运行。

>**注意：** 如果用的是Windows系统，只有64位的Windows才能安装docker。


**II. 装载docker镜像文件：**

首先下载该教程的配套文件，[Bioinfo\_docker.tar](https://cloud.tsinghua.edu.cn/f/fef06408bbc446f6bb6e/?dl=1)，到本地目录，如~/Desktop。


_**MacOS**_

首先检查docker程序已经运行，然后打开**Terminal**(终端)程序进行操作，基本命令如下：


```bash
##install and run a centos docker for the first time
docker run -it --name=centos -h centos -v ~/Documents/centos/:/mac centos
# docker run -it --name=container_name -h hostname -v /HOST_ABSOLUTE_DIR:/CONTAINER_ABSOLUTE_DIR image_name:tag
# simple version docker run -it centos

##add user
useradd john
passwd john
su john

###detach (pause) and attach
ctrl+p+q     # detach退出: 容器不关闭，容器内部正在运行的任务不会停止. ctrl+p+q表示按住ctrl不动，先按下p，后按下q
docker attach container_name # attach进入


###exit and delete a container
exit #inside docker as root, then exit
docker rm container_name
```


_**Windows**_

安装好docker后，按照提示开启hyper-v功能。运行docker，打开**powershell**程序进行操作，操作命令同MacOS版本。

> **注意：** 如果安装时选择了Windows容器版本，则需要在运行了docker之后，从选项卡选择切换到Linux容器版本。
![](/.gitbook/assets/docker_switch.png)



