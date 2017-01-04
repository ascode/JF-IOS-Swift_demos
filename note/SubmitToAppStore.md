### Error：ERROR ITMS-90474: "Invalid Bundle. iPad Multitasking support requires these orientations:

提交app是遇到如下错误：
ERROR ITMS-90475: "Invalid Bundle. iPad Multitasking support requires launch story board in bundle 'xxxx'."  
ERROR ITMS-90474: "Invalid Bundle. iPad Multitasking support requires these orientations: 'UIInterfaceOrientationPortrait,UIInterfaceOri


这是由于提交app适配ios9的ipad的分屏导致的，只要如下图操作就可以了  
![](http://image.bgenius.cn/jinfei/github/IOSDemos/20150920160044257.jpeg)


### iOS 打包上传-22421错误

app上传的时候要做很多准备工作：配置证书，生成描述文件，账号申请，app介绍填写，app打包。。。今天我就介绍一下打包的过程，app打包过程本身不复杂，但是会出现很多问题（苹果服务器，你懂得）。首先是把Edit Scheme下的Run的状态由Debug改为release，正式的发布状态。
![](http://image.bgenius.cn/jinfei/github/IOSDemos/20160613202143347.png)


然后把Build Setting 里的Code signing 里的Code Signing identity下的release设置为描述文件状态
![](http://image.bgenius.cn/jinfei/github/IOSDemos/20160613202657702.png)

在接下来就是把模拟器选择置为Generic iOS Device并点击Product -> Archive进入打包，进入之后选择右边的UpLoad to App Store按照提示一步步上传打好的包

遇到这样的情况或者错误代码-22421错误，可直接点击Done 然后通过右边的Export直接生成IPA包，然后下载Application Loader，通过Application Loader直接上传，Application Loader的配置十分简单
![](http://image.bgenius.cn/jinfei/github/IOSDemos/20160613203507943.png)

之后就直接选取IPA文件就可以上传了，速度特别快。
