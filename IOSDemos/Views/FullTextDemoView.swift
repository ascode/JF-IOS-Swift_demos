//
//  FullTextDemo.swift
//  IOSDemos
//
//  Created by 金飞 on 27/12/2016.
//  Copyright © 2016 Enjia. All rights reserved.
//

import UIKit

class FullTextDemoView: UIView {
    
    var _delegate: FullTextDemoViewDelegate!

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
        btnBack.addTarget(self, action: #selector(FullTextDemoView.btnBackPressed(btnObj:)), for: UIControlEvents.touchUpInside)
        
        
        let klblW: CGFloat = UIScreen.main.bounds.width
        let klblX: CGFloat = 0
        let klblY: CGFloat = UIScreen.main.bounds.height * 0.3
        var ss = ""
        let s = NSMutableAttributedString(string: "金老大", attributes: [NSLinkAttributeName: "http://www.baidu.com"])
        ss += "金老大"
        s.append(NSMutableAttributedString(string: ",你需要来点咖啡吗?", attributes: [NSForegroundColorAttributeName: UIColor.black]))
        ss += ",你需要来点咖啡吗?"
        s.append(NSMutableAttributedString(string: "你是需要咖啡还是茶呢？", attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 30)]))
        ss += "你是需要咖啡还是茶呢？"
        s.append(NSMutableAttributedString(string: "我们这的茶很好喝，你需要尝尝吗？", attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 30), NSForegroundColorAttributeName: UIColor.blue]))
        ss += "我们这的茶很好喝，你需要尝尝吗？"
        s.addAttribute(NSForegroundColorAttributeName, value: UIColor.red, range: NSMakeRange(5, 2))
        s.addAttribute(NSFontAttributeName, value: UIFont.boldSystemFont(ofSize: 22), range: NSMakeRange(5, 3))
        
        print("\(NSString(string: ss).range(of: "你").location),\(NSString(string: ss).range(of: "你").length)")
        print("\(NSString(string: ss).range(of: "你", options: NSString.CompareOptions.numeric).location),\(NSString(string: ss).range(of: "你", options: NSString.CompareOptions.numeric).location)")
        print("\(NSString(string: ss).range(of: "你", options: NSString.CompareOptions.numeric, range: NSMakeRange(0, 5)).location),\(NSString(string: ss).range(of: "你", options: NSString.CompareOptions.numeric, range: NSMakeRange(6 , 15)).location)")
        
        let lbl: UILabel = UILabel()
        lbl.numberOfLines = 0
        lbl.lineBreakMode = NSLineBreakMode.byCharWrapping
        lbl.attributedText = s
        let sRect: CGRect = (lbl.attributedText?.boundingRect(with: CGSize(width: klblW, height: CGFloat.greatestFiniteMagnitude), options: NSStringDrawingOptions.usesLineFragmentOrigin , context: nil))!
        lbl.frame = CGRect(x: klblX, y: klblY, width: sRect.width, height: sRect.height)
        
        
        self.addSubview(lbl)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func btnBackPressed(btnObj: UIButton){
        self._delegate.btnBackPressed(btnObj: btnObj)
    }

}
