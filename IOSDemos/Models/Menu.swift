//
//  Menu.swift
//  IOSDemos
//
//  Created by 金飞 on 27/12/2016.
//  Copyright © 2016 Enjia. All rights reserved.
//

import UIKit

class Menu {

    var _menuName: String!

    init(dict: NSDictionary) {
        self._menuName = dict.value(forKey: "text") as! String!
    }
}
