
# UITabBarController的使用  


### 一、简单介绍    
    UITabBarController和UINavigationController类似,UITabBarController也可以轻松地管理多个控制器,轻松完成控制器之间的切换,典型的例子就是QQ、微信等应⽤。  
![](http://image.bgenius.cn/jinfei/github/IOSDemos/072227041775001.png)  

### 二、UITabBarController的使用   
#### 1.使用步骤：  

（1）初始化UITabBarController  
（2）设置UIWindow的rootViewController为UITabBarController  
（3）创建相应的子控制器（viewcontroller）  
（4）把子控制器添加到UITabBarController  

#### 2.代码示例  

新建一个空的文件，在Application的代理中编码  

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        //1.创建Window
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = UIColor.white
        
        
        //a.初始化一个tabBar控制器
        let tbC: UITabBarController = UITabBarController()
        //设置控制器为Window的根控制器
        self.window.rootViewController=tb;
    
        //b.创建子控制器
        let vc1: UIViewController = UIViewController()
        vc1.view.backgroundColor = UIColor.gray
        vc1.view.backgroundColor = UIColor.green
        vc1.tabBarItem.title = "消息"
        vc1.tabBarItem.image = #imageLiteral(resourceName: "ic-purchase")
        vc1.tabBarItem.badgeValue = "123"
        
        let vc2: TabDemosViewController = TabDemosViewController()
        vc2.view.backgroundColor = UIColor.brown
        vc2.tabBarItem.title = "联系人"
        vc2.tabBarItem.image = #imageLiteral(resourceName: "ic-about-us")
        
        
        //c.添加子控制器到ITabBarController中
        //c.1第一种方式
        //            tbC.addChildViewController(vc1)
        //            tbC.addChildViewController(vc2)
        
        //c.2第二种方式
        tbC.viewControllers = [vc1, vc2]
        
        //2.设置Window为主窗口并显示出来
        self.window?.makeKeyAndVisible()

        return true
    }

### 三、重要说明

#### 1.UITabBar 

下方的工具条称为UITabBar ，如果UITabBarController有N个子控制器,那么UITabBar内部就会有N 个UITabBarButton作为子控件与之对应。

注意：UITabBarButton在UITabBar中得位置是均分的，UITabBar的高度为49。

在上面的程序中，UITabBarController有4个子控制器,所以UITabBar中有4个UITabBarButton，UITabBar的结构⼤大致如下图所示：
![](http://image.bgenius.cn/jinfei/github/IOSDemos/072236159742491.png)  

#### 2.UITabBarButton 

UITabBarButton⾥面显⽰什么内容,由对应子控制器的tabBarItem属性来决定  

    c1.tabBarItem.title=@"消息";  
    c1.tabBarItem.image=[UIImage imageNamed:@"tab_recent_nor"];  
![](http://image.bgenius.cn/jinfei/github/IOSDemos/072238405999340.png)   

#### 3.有两种方式可以往UITabBarController中添加子控制器   

（1）[tb addChildViewController:c1];  

（2）tb.viewControllers=@[c1,c2,c3,c4];  

注意：展示的顺序和添加的顺序一致，和导航控制器中不同，展现在眼前的是第一个添加的控制器对应的View。  









