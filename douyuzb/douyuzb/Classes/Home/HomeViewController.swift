//
//  HomeViewController.swift
//  douyuzb
//
//  Created by mac on 2017/10/23.
//  Copyright © 2017年 mac. All rights reserved.
//

import UIKit

private let kTitleViewHeight : CGFloat = 40

class HomeViewController: UIViewController {
    
    private lazy var pageTitleView: PageTitleView = {
        
        let titleFrame = CGRect(x: 0, y: kStatusBarHeight + kNavigationBarHeight, width: kScreenWidth, height: kTitleViewHeight)
        let titles = ["推荐", "游戏", "娱乐", "趣玩"]
        let titleView = PageTitleView(frame: titleFrame, titles: titles)
        
        return titleView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    


}


// MARK: - 设置UI界面
extension HomeViewController{
    private func setupUI(){
        // 设置导航栏
        setupNavigationBar()
        //添加 TitleView
        view.addSubview(pageTitleView)
    }
    
    private func setupNavigationBar(){
        
        // 1. 设置左侧的item
        let btn = UIButton()
        btn.setImage(UIImage(named: "douban_logo"), for: .normal)
        btn.sizeToFit()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: btn)
        
        // 2. 设置右侧的item
        let size = CGSize(width: 40, height: 40)
        
        let historyItem = UIBarButtonItem(imageName: "ic_applied_icon", highImageName: "douban_logo", size: size)
        let searchItem = UIBarButtonItem(imageName: "ic_check_blue", highImageName: "ic_applied_icon", size: size)
        let qrcodeItem = UIBarButtonItem(imageName: "douban_logo", highImageName: "ic_check_blue", size: size)
        
        
        navigationItem.rightBarButtonItems = [historyItem, searchItem, qrcodeItem]
        
        
    }
}
