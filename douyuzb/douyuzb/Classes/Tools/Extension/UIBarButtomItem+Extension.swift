//
//  UIBarButtomItem+Extension.swift
//  douyuzb
//
//  Created by mac on 2017/10/23.
//  Copyright © 2017年 mac. All rights reserved.
//

import UIKit

extension UIBarButtonItem{
    
    /*
    class func createItem(imageName: String, highImageName: String, size: CGSize) -> UIBarButtonItem {
        
        let btn = UIButton()
        
        btn.setImage(UIImage(named: imageName), for: .normal)
        btn.setImage(UIImage(named: highImageName), for: .highlighted)
        
        btn.frame = CGRect(origin: CGPoint.zero, size: size)
        
        return UIBarButtonItem(customView: btn)
        
    }
 */
    
    @objc convenience init(imageName: String, highImageName: String = "", size: CGSize ) {
        
        let btn = UIButton()
        
        btn.setImage(UIImage(named: imageName), for: .normal)
        
        if highImageName != ""{
        btn.setImage(UIImage(named: highImageName), for: .highlighted)
        }
        
        btn.frame = CGRect(origin: CGPoint.zero, size: size)
        
        self.init(customView: btn)
    }
    
}
