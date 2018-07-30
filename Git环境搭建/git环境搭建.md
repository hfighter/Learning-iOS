---
date: 2018-07-30

---


##git环境搭建(mac)

####1、安装homebrew 或者 直接下载安装cakebrew
- [安装homebrew](https://brew.sh/index_zh-cn.html)

	``` 
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	```

- [安装cakebrew](https://www.cakebrew.com/)

####2、git安装
> brew install git

####3、拉取代码前需要根据github或者gitlab账号生成ssh-key,然后将生成的.pub中的内容拷贝到github或者gitlib的ssh key中

- 1、生成ssh-key

	```
	cd ~/.ssh
	ssh-keygen -t rsa -C "邮箱账号"
	```
	此步骤会生成公钥和私钥，将公钥(xxx.pub)中的内容拷贝到ssh key中
- 2、将密钥加入ssh-agent缓存中[参考](http://man.linuxde.net/ssh-add)

	```
	cd ~/.ssh
	ssh-add -K xxx（私钥）
	```
	
至此git环境已经配置完成，可以通过git clone来克隆代码


####4、如果mac中同时存在github和gitlab的key需要作区分，新版的mac系统每次重启后都需要重新执行ssh-add比较麻烦， 解决方法如下：
- 1、cd ~/.ssh
- 2、touch config
- 3、配置文件
	
	```
	# github
	Host github.com
	HostName github.com
	User youremail.com //github对应的email
	IdentityFile ~/.ssh/id_rsa_github //github对应的私钥

	# coding.net
	Host git.coding.net
	HostName git.coding.net
	User youremail.com //coding对应的email
	IdentityFile ~/.ssh/blog //coding对应的私钥

	# gitlab
	Host gitlab.com
	HostNmae gitlab.com
	User youremail.com //coding对应的email
	IdentityFile ~/.ssh/id_rsa //coding对应的私钥
	```
	
	> 注意：Host和HostNmae必须一样