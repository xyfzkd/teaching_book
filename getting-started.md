# Getting Started

---
## 预修课程准备

1. 基本生物课程：如《遗传学》或《分子生物学》

2. 基本统计课程：如《概率论》或《生物统计》

3. 基本数学课程：如《线性代数》

4. 基本物理课程：如《物理化学》或《生物物理》

5. 基本计算机课程：如 C语言


---
## Virtual Machines

### VirtualBox

We provide a Linux virtual machine \(Download links: [TsinghuaCloud](https://cloud.tsinghua.edu.cn/d/08cb34ba57cf44b8aea9/) or [BaiduYun](https://pan.baidu.com/s/1ETkey)\), which has some bioinfo software pre-installed. You can download the file and open it with [**VirtualBox**](https://www.virtualbox.org/wiki/Downloads) in Windows or Mac.

### Docker (Recommended)

We also provide a Linux docker, which is a modern solution of setting up a virtual Linux OS.


I. 安装： {#i-安装：}

---

课程文件提供已经下载好的适合Mac和Windows的安装包。

也可以自行登录[docker官网](https://www.docker.com/get-docker)注册账号，下载Community Edition版本的docker安装程序进行安装。

II. 使用方法： {#ii-使用方法：}

---

_**MacOS**_

下载[Bioinfo\_docker.tar](https://cloud.tsinghua.edu.cn/f/fef06408bbc446f6bb6e/?dl=1)到本地目录，如~/Desktop，运行docker程序，然后在终端进行操作，基本命令如下：

```
cd ~/Desktop
docker load -i bioinformatic.tar                   # 加载镜像

docker images                                       # 查询镜像

docker run --name bioinfor -it ubuntu:latest    # 运行容器进行后续操作

> cd /home/cs

docker ps -a                                        # 查询容器信息（包括container_id)

docker commit -a author_name -m other_message container_id my_docker      # 从容器建立镜像

docker save -o my_docker.tar my_docker              # 保存镜像

docker kill $container_id                           # 终止容器

docker rm $(docker ps -q -a)                        # 删除所有容器

docker rmi $(docker images -q)                        # 删除所有镜像（不会删除保存的tar文件）
```

_**Windows**_

只有64位的Windows系统才能安装docker，以下操作在64位Win10系统执行。安装的时候选项如图。![](https://lulab.gitbooks.io/teaching/content/img/docker_installation.png)

如果安装时选择了Windows容器版本，则需要在运行了docker之后，从选项卡选择切换到Linux容器版本。![](https://lulab.gitbooks.io/teaching/content/img/docker_switch.png)

安装好docker后，按照提示开启hyper-v功能。运行docker，打开powershell，操作命令同MacOS版本。

### III. 更多阅读： {#iii-更多阅读：}

---

更多命令详见[docker命令大全](http://www.runoob.com/docker/docker-command-manual.html)

