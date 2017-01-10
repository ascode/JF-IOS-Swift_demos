//
//  TabAndDrawerDemosLeftViewController.swift
//  IOSDemos
//
//  Created by 金飞 on 10/01/2017.
//  Copyright © 2017 Enjia. All rights reserved.
//

import UIKit

class TabAndDrawerDemosLeftViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let kselfviewW: CGFloat = UIScreen.main.bounds.width
        let kselfviewH: CGFloat = UIScreen.main.bounds.height - UIApplication.shared.statusBarFrame.height
        let kselfviewX: CGFloat = UIScreen.main.bounds.origin.x
        let kselfviewY: CGFloat = UIScreen.main.bounds.origin.y + UIApplication.shared.statusBarFrame.height
        let selfview: TabAndDrawerDemosLeft = TabAndDrawerDemosLeft(frame: CGRect(x: kselfviewX, y: kselfviewY, width: kselfviewW, height: kselfviewH))
        selfview.backgroundColor = UIColor.white
        self.view = selfview
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
