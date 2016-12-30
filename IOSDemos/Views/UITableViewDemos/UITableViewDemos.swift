//
//  UITableViewDemos.swift
//  IOSDemos
//
//  Created by 金飞 on 29/12/2016.
//  Copyright © 2016 Enjia. All rights reserved.
//

import UIKit

class UITableViewDemos: UIView {

    var _delegate: UITableViewDemosDelegate!
    
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
        btnBack.addTarget(self, action: #selector(ModalA.btnBackPressed(btnObj:)), for: UIControlEvents.touchUpInside)
        
        let kbtnSimpleTableW: CGFloat = UIScreen.main.bounds.width * 0.8
        let kbtnSimpleTableH: CGFloat = 36
        let kbtnSimpleTableX: CGFloat = (UIScreen.main.bounds.width - kbtnSimpleTableW) / 2
        let kbtnSimpleTableY: CGFloat = UIScreen.main.bounds.height * 0.1
        let btnSimpleTable: UIButton = UIButton()
        btnSimpleTable.frame = CGRect(x: kbtnSimpleTableX, y: kbtnSimpleTableY, width: kbtnSimpleTableW, height: kbtnSimpleTableH)
        btnSimpleTable.backgroundColor = UIColor.green
        btnSimpleTable.setTitle("UITableView的基本使用", for: UIControlState.normal)
        btnSimpleTable.addTarget(self, action: #selector(UITableViewDemos.btnSimpleTablePressed(btnObj:)), for: UIControlEvents.touchUpInside)
        
        self.addSubview(btnSimpleTable)
        
        let kbtnCommonTableW: CGFloat = UIScreen.main.bounds.width * 0.8
        let kbtnCommonTableH: CGFloat = 36
        let kbtnCommonTableX: CGFloat = (UIScreen.main.bounds.width - kbtnSimpleTableW) / 2
        let kbtnCommonTableY: CGFloat = kbtnSimpleTableY + kbtnSimpleTableH + kbtnSimpleTableH * 0.8
        let btnCommonTable: UIButton = UIButton()
        btnCommonTable.frame = CGRect(x: kbtnCommonTableX, y: kbtnCommonTableY, width: kbtnCommonTableW, height: kbtnCommonTableH)
        btnCommonTable.backgroundColor = UIColor.green
        btnCommonTable.setTitle("UITableViewCell贴图和间距", for: UIControlState.normal)
        btnCommonTable.addTarget(self, action: #selector(UITableViewDemos.btnCommonTablePressed(btnObj:)), for: UIControlEvents.touchUpInside)
        
        self.addSubview(btnCommonTable)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func btnBackPressed(btnObj: UIButton){
        self._delegate.btnBackPressed(btnObj: btnObj)
    }
    
    func btnSimpleTablePressed(btnObj: UIButton){
        self._delegate.btnSimpleTablePressed(btnObj: btnObj)
    }
    
    func btnCommonTablePressed(btnObj: UIButton){
        self._delegate.btnCommonTablePressed(btnObj: btnObj)
    }

}
