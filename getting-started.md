# Getting Started

## 预修课程准备

1. 基本生物课程：    如《遗传学》和/或《分子生物学》
2. 基本统计课程：    如《概率论》和/或《生物统计》
3. 基本数学课程：    如《线性代数》
4. 基本计算机课程：如《C语言》

## Learning Materials

* Tutorial 
  * **Basic Tutorial** \(this one\) 
  * [**Advanced Tutorial**](https://lulab.gitbook.io/training)  

> see more learning materials in _Appendix I. Keep Learning_

## Document your work

* [Github](https://github.com/lulab/Shared) for students \(shared code and scripts）
  * Write documents with [Markdown](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet) Language

## Virtual Machines

### VirtualBox

We provide a Linux virtual machine \(Download links: [TsinghuaCloud](https://cloud.tsinghua.edu.cn/d/08cb34ba57cf44b8aea9/) or [BaiduYun](https://pan.baidu.com/s/1ETkey)\), which has some bioinfo software pre-installed. You can download the file and open it with [**VirtualBox**](https://www.virtualbox.org/wiki/Downloads) in Windows or Mac.

### Docker \(Recommended\)

We provide a Linux docker, which is a modern solution of setting up a virtual Linux OS.

**I. 安装并运行docker程序：**

从[docker官网](https://www.docker.com/get-docker)下载Mac或Windows版本的docker程序，安装并运行。

> **注意：** 如果用的是Windows系统，只有64位的Windows才能安装docker。

**II. 装载docker镜像文件：**

首先下载该教程的配套文件，[Bioinfo\_docker.tar](https://cloud.tsinghua.edu.cn/f/fef06408bbc446f6bb6e/?dl=1)，到本地目录，例如，可以下载到桌面~/Desktop。

_**MacOS**_

首先检查docker程序已经运行，然后打开**Terminal**\(终端\)程序进行操作，基本命令如下：

```bash
##load image into docker
docker load < ~/Desktop/bioinfo_docker.tar

## run the docker for the first time, create a container called bioinfo_docker
# You can run docker using a simple mode (but a hard start will make your life easier later):
docker run -it bioinfo_docker

# This is a hard start we recommend: 
# 先在桌面上建一个文件夹 "bioinfo" , 该文件夹为主机和docker共享
# docker run -it --name=container_name -h hostname -v /HOST_ABSOLUTE_DIR:/CONTAINER_ABSOLUTE_DIR image_name:tag
docker run -it --name=bioinfo -h bioinfo  -v ~/Desktop/bioinfo:/desktop bioinfo_docker:2018



##add user
useradd -m test -s /bin/bash
passwd test
usermod -aG sudo test
chown -R test /home/cs/Bioinfo_Lab/
su test


##detach (pause) and attach
ctrl+p+q                      # detach: pause, not exit. The job will keep running in the background. 
docker attach bioinfo_docker  # attach：re-enter your docker


##exit and delete a container
exit                          #inside docker as root, then exit
docker rm bioinfo_docker      #delete the container we created by docker run
```

_**Windows**_

安装好docker后，按照提示开启hyper-v功能。运行docker，打开**powershell**程序进行操作，操作命令同MacOS版本。

> **注意：** 如果安装时选择了Windows容器版本，则需要在运行了docker之后，从选项卡选择切换到Linux容器版本\(Switch to Linux containers\)。



