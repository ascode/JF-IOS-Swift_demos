//
//  DataForMenus.swift
//  IOSDemos
//
//  Created by 金飞 on 27/12/2016.
//  Copyright © 2016 Enjia. All rights reserved.
//

import UIKit

class DataForMenus {

    var _menus: [Menu] = []
    
    init(dataPath: String) {
        let menuArray: NSArray = NSArray(contentsOfFile: Bundle.main.path(forResource: "Menu", ofType: "plist")!)!
        
        for i in 0 ..< menuArray.count {
            self._menus.append(Menu(dict: menuArray[i] as! NSDictionary))
        }
    }
}
