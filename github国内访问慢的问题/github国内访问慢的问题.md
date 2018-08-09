在国内访问github经常会出现特别的慢，下面的方法可以在一定程度上加快对github的访问速度。具体操作步骤如下：

####1、获取Github相关网站的IP
在https://www.ipaddress.com中查找，github.global.ssl.fastly.net和github.com的ip地址

####2、修改本地host文件
以Mac为例，命令行下输入：sudo vi /etc/host，增加增加github.global.ssl.fastly.net和github.com的映射，如：

```
151.101.13.194 github.global.ssl.fastly.net  
192.30.253.112 github.com
```

####3、更新DNS缓存
命令行输入：sudo dscacheutil -flushcache，使增加的映射生效。