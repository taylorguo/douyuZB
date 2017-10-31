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
    // MARK:- 懒加载属性
    private lazy var pageTitleView: PageTitleView = { [weak self] in
        let titleFrame = CGRect(x: 0, y: kStatusBarHeight + kNavigationBarHeight, width: kScreenWidth, height: kTitleViewHeight)
        let titles = ["推荐", "游戏", "娱乐", "趣玩"]
        let titleView = PageTitleView(frame: titleFrame, titles: titles)
        titleView.delegate = self
        return titleView
    }()
    
    private lazy var pageContentView : PageContentView = {[weak self] in 
        // 1. 确定内容 Frame
        let contentHight = kScreenHeight - kStatusBarHeight - kNavigationBarHeight - kTitleViewHeight - kTabbarHeight
        let contentFrame = CGRect(x: 0, y: kStatusBarHeight + kNavigationBarHeight + kTitleViewHeight, width: kScreenWidth, height: contentHight)
        
        // 2. 确定所有自控制器
        var childVcs = [UIViewController]()
        childVcs.append(RecommendViewController())
        for _ in 0..<3 {
            let  vc = UIViewController()
            vc.view.backgroundColor = UIColor(r: CGFloat(arc4random_uniform(255)), g: CGFloat(arc4random_uniform(255)), b: CGFloat(arc4random_uniform(255)))
            childVcs.append(vc)
            
        }
        
        let contentView = PageContentView(frame: contentFrame, childVcs: childVcs, parentViewController: self!)
        contentView.delegate = self
        return contentView
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
        // 添加 contentView
        view.addSubview(pageContentView)
        pageContentView.backgroundColor = UIColor.cyan
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


// MARK:- 遵守PageTitleViewDelegate协议
extension HomeViewController : PageTitleViewDelegate{
    func pageTitleView(titleView: PageTitleView, selectedIndex index: Int) {
        print(index)
    }
}

// MARK:- 遵守PageContentViewDelegate协议
extension HomeViewController : PageContentViewDelegate{
    func pageContentView(contentView: PageContentView, progress: CGFloat, sourceIndex: Int, targetIndex: Int) {
        pageTitleView.setTitleWithProgress(progress: progress, sourceIndex: sourceIndex, targetIndex: targetIndex)
    }
}
