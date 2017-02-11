<a name="tableviewscrollindicator" id="tableviewscrollindicator">&nbsp;</a>
### 设置tableview的滚动条偏移  
有时候需要设置tableview的滚动条偏移位置，一句话搞定。  
self.tableView.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, 49, 0);  


<a name="screenvertial" id="screenvertial">&nbsp;</a>
### 让iPhone和iPad都保持竖屏  
1.设置info.plist
Supported interface orientations -> Portrait (bottom home button)  
Supported interface orientations (iPad) -> Portrait (bottom home button)  
![](http://image.bgenius.cn/jinfei/github/IOSDemos/QQ20170105-1@2x.png)

2.设置项目的General属性   
![](http://image.bgenius.cn/jinfei/github/IOSDemos/QQ20170105-0@2x.png)


<a name="setLineHeightforUITextView" id="setLineHeightforUITextView">&nbsp;</a>
### 控制UITextView中的文本行高  
_textView = [[UITextView alloc] initWithFrame:rect];  

NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];  
paragraphStyle.lineSpacing = 5;  

NSDictionary *attributes = @{  
NSFontAttributeName:[UIFont systemFontOfSize:14],  
NSParagraphStyleAttributeName:paragraphStyle  
};  
_textView.attributedText = [[NSAttributedString alloc] initWithString:@"111" attributes:attributes];  


<a name="getversionForApp" id="getversionForApp">&nbsp;</a>
### iOS 代码实现获得应用的版本号(Version／Build)  
［1］概念  

iOS的版本号，一个叫做Version，一个叫做Build，这两个值都可以在Xcode 中选中target，点击“Summary”后看到。 Version在plist文件中的key是“CFBundleShortVersionString”，和AppStore上的版本号保持一致，Build在plist中的key是“CFBundleVersion”，代表build的版本号，该值每次build之后都应该增加1。这两个值都可以在程序中通过下面的代码获得：  

[[[NSBundle mainBundle] infoDictionary] valueForKey:@"key"]  

［2］具体实现  

代码实现获得应用的Verison号：  

[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]  
或  
[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];  

获得build号：  
[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]  



<a name="aboutSize" id="aboutSize">&nbsp;</a>
### IOS中的一些尺寸  
UINavigationBar: 高度默认 44  
UITabBar: 高度默认 49  
状态栏的高度： UIApplication.shared.statusBarFrame.height  


<a name="aboutRate" id="aboutRate">&nbsp;</a>
### iOS应用实现评论功能的两种方法  

#### 第一种:  
在iOS6.0前跳转到AppStore评分一般是直接跳转到AppStore评分  
NSString *evaluateString = [NSString stringWithFormat:@"itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=67787803"];  
[[UIApplication sharedApplication] openURL:[NSURL URLWithString:evaluateString]];  
这种方法实现了跳转到AppStore评分功能。  

#### 第二种：  
在iOS6.0，Apple增加了一个心得功能，当用户需要给APP评分时候，不再跳转到AppStore了，可以在应用内实现打开appstore，苹果提供了一个框架StoreKit.framework,实现步骤如下:  
1:导入StoreKit.framework,在需要跳转的控制器里面添加头文件#import  
2:实现代理SKStoreProductViewControllerDelegate  

//初始化控制器  
let rateC: SKStoreProductViewController = SKStoreProductViewController()  
//设置代理请求为当前控制器本身  
rateC.delegate = self  
//加载一个新的视图展示  
rateC.loadProduct(withParameters: [SKStoreProductParameterITunesItemIdentifier: "1163595775"], completionBlock: { (result: Bool, err: Error?) in  
self.present(rateC, animated: true, completion: {  
  
})  
})  


//取消按钮监听方法    
func productViewControllerDidFinish(_ viewController: SKStoreProductViewController) {  
print("**********productViewControllerDidFinish")  
viewController.dismiss(animated: true) {   
  
}  
}   
第二种种方法实现了应用内置AppStore评分功能。    












