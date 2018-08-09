
#### 一般程序的编译过程分为以下几个步骤：

1、预处理(预编译)

2、编译

3、链接

4、生成可执行文件

#### Xcode编译过程页类似，还有一些特有步骤，如下：

1、预编译，主要是替换include和宏等

2、编译

3、链接，链接工程中依赖的framework和.a

4、拷贝资源(图片，字体，strings等)和编译xib，storyboard，asset
xib编译生成nib文件；storyboard编译生成nib+plist文件；asset编译生成car文件

5、Process info.plist文件

6、Touch app文件

7、Process product packaging(Copy Swift standard libraries（可选）)

8、app sign(包签名)

9、validate app(连接真机编译)

如果工程依赖于其它target会优先编译依赖的target。
这些过程可以在Xcode中查看：

![](https://raw.githubusercontent.com/hfighter/Learning-iOS/master/Xcode%E7%BC%96%E8%AF%91%E8%BF%87%E7%A8%8B/build.jpeg)




