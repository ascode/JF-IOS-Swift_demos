iOS IAP恢复
2015-06-29 11:40 1251人阅读 评论(0) 收藏 举报
分类： iOS_IAP应用内购买（7）  
//——2012-6-25日更新iap恢复

看到很多童鞋说让Himi讲解如何恢复iap产品，其实博文已经给出了。这里再详细说下:

首先向AppStore请求恢复交易：


1

[[SKPaymentQueue
defaultQueue] restoreCompletedTransactions];
然后当用户输入正确的appStore账号密码后，进入

- (void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray *)transactions//交易结果

进入上面函数中的


1

2

3

4

5

6

case

SKPaymentTransactionStateRestored://恢复

{

[self
restoreTransaction:transaction];



}

break;
然后我们再以下重写函数中处理即可！

- (void) restoreTransaction: (SKPaymentTransaction *)transaction

//——-
