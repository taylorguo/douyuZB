//
//  MainViewController.swift
//  douyuzb
//
//  Created by mac on 2017/10/23.
//  Copyright © 2017年 mac. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChildVc(storyboardName: "Home")
        addChildVc(storyboardName: "Live")
        addChildVc(storyboardName: "Follow")
        addChildVc(storyboardName: "Profile")
        
    }
    
    private func addChildVc(storyboardName: String){
        
        // 1. 通过Storyboard获取控制器
        let childVc = UIStoryboard(name: storyboardName, bundle: nil).instantiateInitialViewController()!
        
        // 2. 将childVc作为自控制器
        addChildViewController(childVc)
    }

    
}
