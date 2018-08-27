# Getting Started

## 预修课程准备

1. 基本生物课程：    如《遗传学》和/或《分子生物学》
2. 基本统计课程：    如《概率论》和/或《生物统计》
3. 基本数学课程：    如《线性代数》
4. 基本计算机课程：如《C语言》

## Learning Materials

* Tutorial 
  * **Basic Tutorial** (this one) 
  * [**Advanced Tutorial**](https://lulab.gitbook.io/training)  

> see more learning materials in _Appendix I. Keep Learning_

## GitHub - Document your work 

* [GitHub](https://github.com/lulab/Shared) for students (shared code and scripts）
  * Write documents with [Markdown](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet) Language

## Virtual Machines

### Option 1. VirtualBox

We provide a Linux virtual machine (Download links: [TsinghuaCloud](https://cloud.tsinghua.edu.cn/d/08cb34ba57cf44b8aea9/) or [BaiduYun](https://pan.baidu.com/s/1ETkey)), which has some bioinfo software pre-installed. You can download the file and open it with [**VirtualBox**](https://www.virtualbox.org/wiki/Downloads) in Windows or Mac.

### Option 2. Docker (Recommended)

We provide a Linux Docker, which is a modern solution of setting up a virtual Linux OS. (For advanced users, the Docker is based on Ubuntu, which means you need to use `apt` to install additional softwares.)

**I. 安装并运行 Docker 程序：**

从 [Docker 官网](https://www.docker.com/get-docker)下载 Mac 或Windows版本的 Docker 程序，安装并运行。

> **注意：** 如果用的是 Windows 系统，只有64位的 Windows 才能安装 Docker。

**II. 装载 Docker 镜像文件：**

首先下载该教程的配套文件，[bioinfo_docker.tar.zip](https://cloud.tsinghua.edu.cn/f/b1f268dec4664c349cf8/)，到本地目录，例如，可以下载到桌面 （`~/Desktop`）。

_**MacOS**_

首先检查 Docker 程序已经运行，然后打开 **Terminal** （终端）程序进行操作，基本命令如下：

```bash
##load image file into Docker
docker load < ~/Desktop/bioinfo_docker.tar

## run the docker for the first time, create a container called bioinfo_docker
# You can run docker using a simple mode (but a hard start will make your life easier later):
docker run -it bioinfo_docker

# This is a hard start we recommend: 
# 先在桌面上建一个文件夹 "bioinfo" , 该文件夹为主机和Docker共享
# docker run -it --name=container_name -h hostname -v /HOST_ABSOLUTE_DIR:/CONTAINER_ABSOLUTE_DIR image_name:tag
docker run -it --name=bioinfo -h bioinfo  -v /Users/your_account/Desktop/bioinfo:/desktop bioinfo_docker
# replace "your_account" to your own name

##add a user called cs
useradd -m cs -s /bin/bash
passwd cs
usermod -aG sudo cs
chown -R test /home/cs/Bioinfo_Lab/
su cs


##detach (pause) and attach
ctrl+p+q                      # detach: pause, not exit. The job will keep running in the background. 
docker attach bioinfo         # attach：re-enter your docker


##exit and delete a container
exit                          #inside Docker as root, then exit
docker rm bioinfo             #delete the container we created by docker run
```

_**Windows**_

安装好 Docker后，按照提示开启 hyper-v 功能。运行 Docker，打开**powershell** 程序进行操作，操作命令同 MacOS 版本。

> **注意：** 如果安装时选择了 Windows 容器版本，则需要在运行了  Docker 之后，从选项卡选择切换到 Linux 容器版本（Switch to Linux containers）。

## Homework

1. Register a GitHub account, create a repository. and write a README.md file online.
2. Install Docker on your own machine, dowload the docker image file, [Bioinfo_docker.tar](https://cloud.tsinghua.edu.cn/f/fef06408bbc446f6bb6e/?dl=1), from this tutorial, then run it. 

### [如何在mac中使用docker youtube](https://youtu.be/c1ldhV7dAhg)

<iframe width="800" height="600" src="https://www.youtube.com/embed/c1ldhV7dAhg" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

### [如何在mac中使用docker bilibili](https://www.bilibili.com/video/av30426956/)

<iframe width="600" height="500" src="https://www.bilibili.com/video/av30426956/" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>


<video width="800" height="600" controls>
  <source src=".gitbook/assets/igv.mp4" type="video/mp4">
  Gitbook can't use mp4
</video>
