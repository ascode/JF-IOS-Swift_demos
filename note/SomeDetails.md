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
