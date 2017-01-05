## iOS IAP恢复
2015-06-29 11:40 1251人阅读 评论(0) 收藏 举报
分类： iOS_IAP应用内购买（7）  
//——2012-6-25日更新iap恢复

看到很多童鞋说让Himi讲解如何恢复iap产品，其实博文已经给出了。这里再详细说下:

1.首先要监听交易过程：  
// 监听购买结果
SKPaymentQueue.default().add(self)

2.然后向AppStore请求恢复交易：  
SKPaymentQueue.default().restoreCompletedTransactions()  
然后当用户输入正确的appStore账号密码后，进入  
- (void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray *)transactions//交易结果  
进入上面函数中的  

1 case

2 SKPaymentTransactionStateRestored://恢复

3 {

4 [self restoreTransaction:transaction];

5 }

6 break;  

然后我们再以下重写函数中处理即可！    

- (void) restoreTransaction: (SKPaymentTransaction *)transaction  


## iOS In-App Purchase中涉及到的货币单位
<span id="money"></span>
现在iOS的AppStore上各类应用非常丰富，有付费的也有免费的，而免费的应用也可以支持IAP (In-App Purchase，应用内支付) 。 对于应用内支付，我们有时候希望对用户的支付行为进行记录，甚至通过记录支付过程进行记账，那在这个过程中用户支付所使用的货币类型是我们需要考虑的一个问题，这里我整理一下。  

做过iOS发布的朋友应该都知道，我们在iTunes Connect上发布一款应用的时候会选择发布的国家/地区。这实际上也就是说我们在不同国家地区的AppStore上，可下载安装的应用是不同的，而且这与用户的Apple ID账号有关。  

所以，本文的问题主要是针对多地区发布的，如果你的应用只在中国大陆发布，而不考虑港、澳、台及其他国家和地区，应用收费只需要关注人民币就可以了。  

在iTunes Connect提交IAP商品信息时，我们定的价格只需要选择对应的Price Tier，苹果的AppStore会根据特定的货币单位转换成对应的值。  

在应用客户端里，商品信息通过向AppStore发起SKProductsRequest获得。每一个商品的价格等由一个SKProduct对象来维护，其中有两个重要属性：  

* price，一个NSDecimalNumber类对象  
* priceLocale，一个NSLocale对象，表示地区信息，和price的数值对应；这里面包含的东西就多了，其中包括一个货币单位    

一个商品，比如设置了Tier1，那么如果他在美国AppStore发布，即用户账号是在美国AppStore登录，则得到的price是0.99，单位是USD；而如果在中国大陆，则是6，单位CNY。关于货币单位，这其中有几种办法，可以通过localeIdentifier方法来获取，也可以通过key-value的方式获取到。  

如果需要在付款时给用户提示，显示的字符串可以这样拼凑：  

1 NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];    
2 [numberFormatter setFormatterBehavior:NSNumberFormatterBehavior10_4];  
3 [numberFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];  
4 [numberFormatter setLocale:product.priceLocale];  
5 NSString *formattedPrice = [numberFormatter stringFromNumber:product.price];  

这也是苹果官方文档给出的示例代码。其中主要是使用了NSNumberFormatter类，behavior是和操作系统版本有关的参数，style则是显示NSDecimalNumber时的格式，除了CurrencyStyle这个常量还有百分号、科学计数法等风格，读者可以自己尝试，locale则决定了CurrencyStyle下的货币单位符号，而且仅仅是符号。注意一点，NSNumberFormatter不会根据单位和汇率给你做货币数值转换的工作，如果需要转成统一货币，那要自己根据实时汇率做转换计算喽。  

除了货币单位，每个商品可以在iTunesConnect上配置本地化/国际化的名称和描述信息，这里就不多说了。  

有关货币单位，可以参看苹果的支付协议文档或App Store Pricing Matrix，也可以参看ISO 4217上的内容：  

[ISO4217（维基百科）](http://zh.wikipedia.org/wiki/ISO_4217)  
