//
//  SimpleTableView.swift
//  IOSDemos
//
//  Created by 金飞 on 29/12/2016.
//  Copyright © 2016 Enjia. All rights reserved.
//

import UIKit

class SimpleTableView: UIView, UITableViewDelegate, UITableViewDataSource {

    var _delegate: SimpleTableViewDelegate!
    
    var _table: UITableView!
    
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
        
        
        let ktableW: CGFloat = frame.width
        let ktableH: CGFloat = frame.height - kbtnBackH
        let ktableX: CGFloat = frame.origin.x
        let ktableY: CGFloat = frame.origin.y + kbtnBackH
        let rectForTable: CGRect = CGRect(x: ktableX, y: ktableY, width: ktableW, height: ktableH)
        self._table = UITableView(frame: rectForTable, style: UITableViewStyle.plain)
        self._table.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cc")
        self._table.delegate = self
        self._table.dataSource = self
        
        self.addSubview(self._table)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func btnBackPressed(btnObj: UIButton){
        self._delegate.btnBackPressed(btnObj: btnObj)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cc", for: indexPath)
        
        cell.textLabel?.text = "孙悟空来了"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

}
