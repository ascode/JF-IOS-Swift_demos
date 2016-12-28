//
//  ModalViewController.swift
//  IOSDemos
//
//  Created by 金飞 on 28/12/2016.
//  Copyright © 2016 Enjia. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController, ModalDemosViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        let kselfviewW: CGFloat = UIScreen.main.bounds.width
        let kselfviewH: CGFloat = UIScreen.main.bounds.height - UIApplication.shared.statusBarFrame.height
        let kselfviewX: CGFloat = UIScreen.main.bounds.origin.x
        let kselfviewY: CGFloat = UIScreen.main.bounds.origin.y + UIApplication.shared.statusBarFrame.height
        let selfview: ModalDemosView = ModalDemosView(frame: CGRect(x: kselfviewX, y: kselfviewY, width: kselfviewW, height: kselfviewH))
        selfview.backgroundColor = UIColor.white
        selfview._delegate = self
        self.view = selfview
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func btnBackPressed(btnObj: UIButton) {
        self.dismiss(animated: true) {
            
        }
    }
    
    func btnModalAPressed(btnObj: UIButton){
        
        
        let modalAVC: ModalAViewController = ModalAViewController()
        self.definesPresentationContext = true //self is presenting view controller
        modalAVC.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        modalAVC.view.backgroundColor = UIColor(colorLiteralRed: 0, green: 0, blue: 0, alpha: 0.4)
        
        self.present(modalAVC, animated: true) {
            
        }
        
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
