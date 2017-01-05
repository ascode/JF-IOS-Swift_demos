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
