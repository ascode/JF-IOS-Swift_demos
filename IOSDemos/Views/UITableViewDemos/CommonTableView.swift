//
//  CommonTableView.swift
//  IOSDemos
//
//  Created by 金飞 on 29/12/2016.
//  Copyright © 2016 Enjia. All rights reserved.
//

import UIKit

class CommonTableView: UIView, UITableViewDelegate, UITableViewDataSource  {

    
    var _delegate: CommonTableViewDelegate!
    
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
        
        
        let ktableW: CGFloat = frame.width - 30
        let ktableH: CGFloat = frame.height - kbtnBackH
        let ktableX: CGFloat = (frame.width - ktableW) / 2
        let ktableY: CGFloat = frame.origin.y + kbtnBackH
        let rectForTable: CGRect = CGRect(x: ktableX, y: ktableY, width: ktableW, height: ktableH)
        self._table = UITableView(frame: rectForTable, style: UITableViewStyle.plain)
        self._table.register(CommonTableCell.classForCoder(), forCellReuseIdentifier: "cc")
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
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cc", for: indexPath)
        
        cell.textLabel?.text = "孙悟空2号来了"
        cell.detailTextLabel?.text = "看看的我衣服和地盘"
        
        cell.textLabel?.backgroundColor = UIColor.clear
        cell.detailTextLabel?.backgroundColor = UIColor.clear
        
        cell.imageView?.image = #imageLiteral(resourceName: "ic-twitter")

        let imgBG: UIImageView = UIImageView()
        imgBG.frame = cell.contentView.frame
        imgBG.image = #imageLiteral(resourceName: "table_cell_item_bg")
        
        cell.insertSubview(imgBG, belowSubview: cell.contentView)
        cell.contentView.backgroundColor = UIColor.clear
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 15
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let v: UIView = UIView()
        return v
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}
