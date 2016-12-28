//
//  Menus.swift
//  IOSDemos
//
//  Created by 金飞 on 27/12/2016.
//  Copyright © 2016 Enjia. All rights reserved.
//

import UIKit

class MenusView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    var _data: DataForMenus!
    var _delegate: MenusViewDelegate!
    
    var menuList: UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.menuList = UITableView(frame: frame, style: UITableViewStyle.plain)
        self.menuList.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cc")
        self.menuList.dataSource = self
        self.menuList.delegate = self
        self.addSubview(self.menuList!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self._data._menus.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cc", for: indexPath)
        cell.textLabel?.text = self._data._menus[indexPath.row]._menuName!
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self._delegate.tableView(tableView, didSelectRowAt: indexPath)
    }

}
