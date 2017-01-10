//
//  ViewController.swift
//  IOSDemos
//
//  Created by 金飞 on 27/12/2016.
//  Copyright © 2016 Enjia. All rights reserved.
//

import UIKit
import MMDrawerController

class ViewController: UIViewController, MenusViewDelegate {
    
    var menuListData: DataForMenus!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let da: DataForMenus = DataForMenus(dataPath: "Menu.plist")
        self.menuListData = da
        let kselfviewW: CGFloat = UIScreen.main.bounds.width
        let kselfviewH: CGFloat = UIScreen.main.bounds.height - UIApplication.shared.statusBarFrame.height
        let kselfviewX: CGFloat = UIScreen.main.bounds.origin.x
        let kselfviewY: CGFloat = UIScreen.main.bounds.origin.y + UIApplication.shared.statusBarFrame.height
        let selfview: MenusView = MenusView(frame: CGRect(x: kselfviewX, y: kselfviewY, width: kselfviewW, height: kselfviewH))
        selfview._data = self.menuListData
        selfview._delegate = self
        selfview.backgroundColor = UIColor.white
        self.view = selfview
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(self.menuListData._menus[indexPath.row]._menuName!)")
        if self.menuListData._menus[indexPath.row]._menuName! == "富文本" {
            let fullTextVC: FullTextDemoViewController = FullTextDemoViewController()
            self.present(fullTextVC, animated: true, completion: {
                
            })
        }
        if self.menuListData._menus[indexPath.row]._menuName! == "语音合成" {
            let ttsVC: SpeechSynthesizerDemoViewController = SpeechSynthesizerDemoViewController()
            self.present(ttsVC, animated: true, completion: {
                
            })
        }
        if self.menuListData._menus[indexPath.row]._menuName! == "播放本地和网络音频文件" {
            let ttsVC: PlayVoiceFormNetViewController = PlayVoiceFormNetViewController()
            self.present(ttsVC, animated: true, completion: {
                
            })
        }
        if self.menuListData._menus[indexPath.row]._menuName! == "模态/半透明模态窗口" {
            let ttsVC: ModalViewController = ModalViewController()
            self.present(ttsVC, animated: true, completion: {
                
            })
        }
        if self.menuListData._menus[indexPath.row]._menuName! == "UITableView和TableViewCell的展开" {
            let ttsVC: UITableViewDemosViewController = UITableViewDemosViewController()
            self.present(ttsVC, animated: true, completion: {
                
            })
        }
        if self.menuListData._menus[indexPath.row]._menuName! == "局部动画" {
            
        }
        if self.menuListData._menus[indexPath.row]._menuName! == "帧动画" {
            
        }
        if self.menuListData._menus[indexPath.row]._menuName! == "Tab和Drawer布局" {
            
            //a.初始化一个tabBar控制器
            let tbC: UITabBarController = UITabBarController()
            
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

            let leftDrawer: UIViewController = TabAndDrawerDemosLeftViewController()
            let tabDemosVC: TabDemosViewController = TabDemosViewController()
        
            let drawerController: MMDrawerController = MMDrawerController(center: tbC, leftDrawerViewController: leftDrawer)
            drawerController.openDrawerGestureModeMask = MMOpenDrawerGestureMode.all
            drawerController.closeDrawerGestureModeMask = MMCloseDrawerGestureMode.all
            
            
            self.present(drawerController, animated: true, completion: {
                
            })
        }
    }

}

