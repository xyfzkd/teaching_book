# Docker
---

##  {#pipeline}

## Pipeline {#pipeline}

![](https://blobscdn.gitbook.com/v0/b/gitbook-28427.appspot.com/o/assets%2F-LKVqnYQRAUMNxYIv37L%2F-LKzy_S2L64ALvymCkQn%2F-LKzzmAQ2xzEohrbgIIV%2Fdocker pipeline.png?alt=media&token=fcf6d5c0-47ea-4494-9e78-22b46ff0229e)
---
## Data Structure {#data-structure}

We provide a Linux docker, which is a modern solution of setting up a virtual Linux OS.

1**. 安装并运行docker程序：**

从[docker官网](https://www.docker.com/get-docker)下载Mac或Windows版本的docker程序，下载注册docker账号，然后安装。安装完成后，需要检查软件是否正常运行，docker官网有docker get started，例如MAC用户可以按照进入[get started](https://docs.docker.com/docker-for-mac/)地址，按照提示启动并设置Docker Desktop。

> 这里推荐阅读两篇Docker安装教程，分别是[《macOS 安装 Docker》](https://yeasy.gitbooks.io/docker_practice/install/mac.html)和[《Windows 10 PC 安装 Docker CE》](https://yeasy.gitbooks.io/docker_practice/install/windows.html)，来自于[《Docker——从入门到实践》](https://legacy.gitbook.com/book/yeasy/docker_practice/details)书，这本书对Docker进行了深入浅出的讲解，对于初学者理解和学习docker技术有所帮助。另外，网上也有很多docker教程，有深入学习兴趣的同学可以自行检索学习。

​

2**. 装载docker镜像文件：**

首先下载该教程的配套文件，[bioinfor\_docker.bar](https://cloud.tsinghua.edu.cn/f/fef06408bbc446f6bb6e/?dl=1)，到本地目录，例如，下载到桌面~/Desktop。

> **注意：**该教程默认操作路径：/User/your\_account\(你的电脑用户名\)/Desktop/bioinfo\_docker.bar

### Inputs & \#Outputs--Notes {#inputs-and-outputs-notes}

```
docker load 
<
 ~/Desktop/bioinfo_docker.tar
#安装镜像
docker run -it --name=bioinfo -h bioinfo -v /Users/your_account/Desktop/bioinfo:/Desktop ubuntu:latest
#创建并进入name=bioinfo新容器(命令行-v /Users/your_account/Desktop/bioinfo:/Desktop是用于挂载主机目录的方法，详细使用方法可以参考本节Tips/Utilities部分介绍)
​
useradd -m cs -s /bin/bash #创建新用户cs
passwd cs #设置新用户密码
usermod -aG sudo cs #修改用户信息
chown -R root /home/cs  #修改目录所有者
su cs #切换用户
​
exit #退出当前用户（容器）
​
docker stop bioinfo #停止bioinfo容器
docker start bioinfo #启动bioinfo容器
docker attach bioinfo #进入bioinfo容器

docker detach bioinfo #暂停bioinfo容器，快捷键为ctrl+p+q(此时若要恢复容器使用则使用attach命令进入容器)
​
docker ps #查看当前正在运行的容器
docker ps -a #查看所有容器
docker iamges #查看所有镜像
docker stop bioinfo #停止bioinfo容器
docker rm contianer_name #删除容器（参数为容器name)
docker rmi image_ID #删除镜像（参数为镜像ID）
```

---
## Running Scripts（MacOS+**Terminal**\(终端\)程序进行操作）

#### 1.Load image

输入命令`docker load < ~/Desktop/bioinfor_docker.tar`（注意空格），如果`load`成功，则输出以下内容：

> `qianqiandexiaopingguodeMacBook-Pro:~ daisy$ docker load < ~/Desktop/bioinfor_docker.tar db9476e6d963: Loading layer [==================================================>] 83.62MB/83.62MB 3a89e0d8654e: Loading layer [==================================================>] 15.87kB/15.87kB 904d60939c36: Loading layer [==================================================>] 10.24kB/10.24kB a20a262b87bd: Loading layer [==================================================>] 5.632kB/5.632kB b6f13d447e00: Loading layer [==================================================>] 3.072kB/3.072kB 82143e17d6a8: Loading layer [==================================================>] 1.081GB/1.081GB 88376dbb6a81: Loading layer [==================================================>] 75MB/75MB 3374281cd25f: Loading layer [==================================================>] 107.4MB/107.4MB 270db015b4b1: Loading layer [==================================================>] 238MB/238MB a79214c809ab: Loading layer [==================================================>] 149MB/149MB 5d983e72cca3: Loading layer [==================================================>] 992.5MB/992.5MB Loaded image: ubuntu:latest`

#### 2.First time running & Create container

有以下两种操作：

方法一：自动运行并进入docker镜像，输入`docker run -it ubuntu:latest`命令 ，如果`run`成功进入镜像，则输出以下内容（注意：此时docker自动创建并进入了ID为148601f6edf1的容器）：

> `root@148601f6edf1:/#`

方法二：创建并进入一个名为“bioinfo“的容器，输入命令，`docker run -it --name=bioinfo -h bioinfo ubuntu:latest`

如果创建成功，则输出以下内容：

> `root@bioinfo:/#`

#### 3. add new user

创建新用户`cs`，并进入`cs`目录。此过程需要经过`创建新用户`、`设置用户密码`、`修改用户信息`、`修改目录所有者`、`切换用户身份`五个步骤，输入命令分别如下所示：

创建新用户：`useradd -m cs -s /bin/bash`

设置用户密码：`passwd cs`

输出如下

> `Enter new UNIX password:`
>
> `Retype new UNIX password:`
>
> `passwd: password updated successfully`

修改用户信息：`usermod -aG sudo cs`

修改目录所有者：`chown -R root /home/cs`

切换用户身份：`su cs`

> 例如
>
> ```
> root@bioinfo:/# usermod -aG sudo cs
> root@bioinfo:/# chown -R root /home/cs
> root@bioinfo:/# su cs
> To run a command as administrator (user "root"), use "sudo 
> <
> command
> >
> ".
> See "man sudo_root" for details.
> ​
> cs@bioinfo:/$
> ```

#### 4.exit

输入命令`exit`，则会一层一层退出，直到进入terminal用户界面。

> 例如
>
> ```
> cs@bioinfo:/$ exit
> exit
> root@bioinfo:/# exit
> exit
> qianqiandexiaopingguodeMacBook-Pro:
> ```

#### 5.detach & attach

第一步，输入`detach`命令快捷键`ctrl+p+q`，暂停当前容器，不会停止，容器仍在运行，可以输入`docker ps`查看；

第二步，输入命令`docker attach bioinfo`，则可恢复。

> 例如
>
> ```
> root@bioinfo:/# read escape sequence
> qianqiandexiaopingguodeMacBook-Pro:~ daisy$ docker ps
> CONTAINER ID        IMAGE                   COMMAND             CREATED             STATUS              PORTS               NAMES
> 40e01dc8c209        dongzhuoer/lulab:base   "/bin/bash"         30 hours ago        Up 30 hours                             bio
> bd0fae9c5092        ubuntu:latest           "/bin/bash"         36 hours ago        Up 39 seconds                           bioinfo
> qianqiandexiaopingguodeMacBook-Pro:
> ​
> ```

#### 6. start&stop

第一步，输入`docker ps`，查看当前运行的容器，输入命令`docker stop bioinfo`,停止bioinfo容器，效果等同于bioinfo运行状态下使用`exit`命令；

第二步，输入命令`docker start bioinfo`，启动bioinfo容器；

第三步，输入命令`docker attach bioinfo`，则可进入。

> 例如
>
> ```
> qianqiandexiaopingguodeMacBook-Pro:~ daisy$ docker ps
> CONTAINER ID        IMAGE                   COMMAND             CREATED             STATUS              PORTS               NAMES
> 40e01dc8c209        dongzhuoer/lulab:base   "/bin/bash"         30 hours ago        Up 30 hours                             bio
> bd0fae9c5092        ubuntu:latest           "/bin/bash"         36 hours ago        Up 2 minutes                            bioinfo
> qianqiandexiaopingguodeMacBook-Pro:~ daisy$ docker stop bioinfo
> bioinfo
> qianqiandexiaopingguodeMacBook-Pro:~ daisy$ docker ps
> CONTAINER ID        IMAGE                   COMMAND             CREATED             STATUS              PORTS               NAMES
> 40e01dc8c209        dongzhuoer/lulab:base   "/bin/bash"         30 hours ago        Up 30 hours                             bio
> qianqiandexiaopingguodeMacBook-Pro:~ daisy$ docker start bioinfo
> bioinfo
> qianqiandexiaopingguodeMacBook-Pro:~ daisy$ docker ps
> CONTAINER ID        IMAGE                   COMMAND             CREATED             STATUS              PORTS               NAMES
> 40e01dc8c209        dongzhuoer/lulab:base   "/bin/bash"         30 hours ago        Up 30 hours                             bio
> bd0fae9c5092        ubuntu:latest           "/bin/bash"         36 hours ago        Up 10 seconds                           bioinfo
> qianqiandexiaopingguodeMacBook-Pro:~ daisy$ 
> ```

#### 7.delete/clean containers and images

删除镜像image前必须先删除此镜像所应用的所有容器containers，删除镜像的命令是`rmi`，删除容器的镜像是`rm`。例如，输入命令`docker images`，查看所有镜像，本此示例删除dongzhuoer/lulab：base 镜像。

> 例如
>
> ```
> qianqiandexiaopingguodeMacBook-Pro:~ daisy$ docker images
> REPOSITORY                                 TAG                 IMAGE ID            CREATED             SIZE
> dongzhuoer/lulab                           base                dc04dfe2738f        46 hours ago        259MB
> centos                                     latest              5182e96772bf        3 weeks ago         200MB
> ubuntu                                     latest              bb702f884abc        3 weeks ago         2.67GB
> ```

第一步，输入命令`docker ps -a`，查询所有容器，dongzhuoer/lulab：base的image版本下只有bio容器，然后输入容器删除命令`docker rm contianer_name or ID`,此处要删除name=bio的容器；

第二步，输入镜像删除命令docker rmi image\_version or ID ,此处要删除dongzhuoer/lulab：base；

最后可以通过`docker images`命令查看镜像是否还存在。

---
## Tips/Utilitie

![](../.gitbook/assets/use-docker.gif)

![](https://blobscdn.gitbook.com/v0/b/gitbook-28427.appspot.com/o/assets%2F-LKVqnYQRAUMNxYIv37L%2F-LL8EsLuKx_pfq1os-gu%2F-LL8MwFb4pWLhbpyg4yk%2Fdocker%20guazai.png?alt=media&token=10aa8057-085e-46ac-a65c-14c854be1251)

上图所示的命令是新建name=bioinfo容器，并将bioinfo容器中的Desktop下路径挂载到mac主机桌面上的bioinfo文件夹中。

因此，在mac的terminal终端输入docker 挂载宿主机目录命令前，必须确定两件事，第一件事是mac桌面上有bioinfo文件夹，没有则需要新创建；第二件事是已经load了ubuntu：latest 镜像。然后才能输入挂载主机目录的命令。

**推荐使用挂载主机目录的方法创建的容器去练习本教程接下来的章节，在所有章节running scripts前切换docker工作目录到Desktop，最后你会发现所有inputs&outputs的文件都会同步到mac桌面的bioinfo文件夹中，便于管理和查看结果。同时，从本地添加到bioinfo文件夹下面的文件或子文件夹，也可以在docker中`ls`查看。**

**so，同步的前提是，工作目录与挂载主机目录一致。也就是说，在所有章节running scripts前切换docker工作目录到Desktop，也就是输入`cd Desktop`命令，否则将无法同步，如下图所示。**

![](https://blobscdn.gitbook.com/v0/b/gitbook-28427.appspot.com/o/assets%2F-LKVqnYQRAUMNxYIv37L%2F-LL8EsLuKx_pfq1os-gu%2F-LL8S9iBryidWsDkFnpf%2Fimage.png?alt=media&token=f92da308-1b53-419b-b456-81522f294bbf)

**​**

## Homework and more

根据教程指导，安装Docker，load本教程提供的ubuntu：latest镜像，完成Running Scripts部分的基础操作练习，然后尝试更多的镜像和容器管理操作，例如容器创建、查看、启动、终止、删除等。

