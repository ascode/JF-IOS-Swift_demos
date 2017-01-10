//
//  TabDemosView.swift
//  IOSDemos
//
//  Created by 金飞 on 10/01/2017.
//  Copyright © 2017 Enjia. All rights reserved.
//

import UIKit

class TabAndDrawerDemosView: UIView {

    var _delegate: TabAndDrawerDemosViewDelegate!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let kbtnBackW: CGFloat = 36
        let kbtnBackH: CGFloat = kbtnBackW
        let kbtnBackX: CGFloat = 15
        let kbtnBackY: CGFloat = 15
        let btnBack: UIButton = UIButton()
        btnBack.frame = CGRect(x: kbtnBackX, y: kbtnBackY, width: kbtnBackW, height: kbtnBackH)
        btnBack.setImage(#imageLiteral(resourceName: "btnBack"), for: UIControlState.normal)
        btnBack.addTarget(self, action: #selector(TabAndDrawerDemosView.btnBackPressed(btnObj:)), for: UIControlEvents.touchUpInside)
        self.addSubview(btnBack)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func btnBackPressed(btnObj: UIButton){
        self._delegate.btnBackPressed(btnObj: btnObj)
    }

}
