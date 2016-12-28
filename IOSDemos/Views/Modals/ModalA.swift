//
//  ModalA.swift
//  IOSDemos
//
//  Created by 金飞 on 28/12/2016.
//  Copyright © 2016 Enjia. All rights reserved.
//

import UIKit

class ModalA: UIView {
    
    var _delegate: ModalADelegate!

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        let kpanelW: CGFloat = UIScreen.main.bounds.width * 0.7
        let kpanelH: CGFloat = kpanelW * 0.8
        let kpanelX: CGFloat = (UIScreen.main.bounds.width - kpanelW) / 2
        let kpanelY: CGFloat = (UIScreen.main.bounds.height - kpanelH) / 2
        let panel: UIView = UIView()
        panel.frame = CGRect(x: kpanelX, y: kpanelY, width: kpanelW, height: kpanelH)
        panel.backgroundColor = UIColor.white
        
        self.addSubview(panel)
        
        
        let kbtnBackW: CGFloat = 36
        let kbtnBackH: CGFloat = kbtnBackW
        let kbtnBackX: CGFloat = 15
        let kbtnBackY: CGFloat = 15
        let btnBack: UIButton = UIButton()
        btnBack.frame = CGRect(x: kbtnBackX, y: kbtnBackY, width: kbtnBackW, height: kbtnBackH)
        btnBack.setImage(#imageLiteral(resourceName: "btnBack"), for: UIControlState.normal)
        
        panel.addSubview(btnBack)
        btnBack.addTarget(self, action: #selector(ModalA.btnBackPressed(btnObj:)), for: UIControlEvents.touchUpInside)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func btnBackPressed(btnObj: UIButton){
        self._delegate.btnBackPressed(btnObj: btnObj)
    }

}
