//
//  ModalView.swift
//  IOSDemos
//
//  Created by 金飞 on 28/12/2016.
//  Copyright © 2016 Enjia. All rights reserved.
//

import UIKit

class ModalDemosView: UIView {

    var _delegate: ModalDemosViewDelegate!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        let kbtnBackW: CGFloat = 36
        let kbtnBackH: CGFloat = kbtnBackW
        let kbtnBackX: CGFloat = 15
        let kbtnBackY: CGFloat = 15
        let btnBack: UIButton = UIButton()
        btnBack.frame = CGRect(x: kbtnBackX, y: kbtnBackY, width: kbtnBackW, height: kbtnBackH)
        btnBack.setImage(#imageLiteral(resourceName: "btnBack"), for: UIControlState.normal)
        
        self.addSubview(btnBack)
        btnBack.addTarget(self, action: #selector(ModalDemosView.btnBackPressed(btnObj:)), for: UIControlEvents.touchUpInside)
        
        
        let kbtnModalAW: CGFloat = UIScreen.main.bounds.width * 0.8
        let kbtnModalAH: CGFloat = 36
        let kbtnModalAX: CGFloat = (UIScreen.main.bounds.width - kbtnModalAW) / 2
        let kbtnModalAY: CGFloat = UIScreen.main.bounds.height * 0.1
        let btnModalA: UIButton = UIButton()
        btnModalA.frame = CGRect(x: kbtnModalAX, y: kbtnModalAY, width: kbtnModalAW, height: kbtnModalAH)
        btnModalA.backgroundColor = UIColor.green
        btnModalA.setTitle("ModalA", for: UIControlState.normal)
        btnModalA.addTarget(self, action: #selector(ModalDemosView.btnModalAPressed(btnObj:)), for: UIControlEvents.touchUpInside)
        
        self.addSubview(btnModalA)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func btnModalAPressed(btnObj: UIButton){
        self._delegate.btnModalAPressed(btnObj: btnObj)
    }
    
    func btnBackPressed(btnObj: UIButton){
        self._delegate.btnBackPressed(btnObj: btnObj)
    }

}
