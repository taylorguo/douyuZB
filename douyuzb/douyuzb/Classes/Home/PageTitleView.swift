//
//  PageTitleView.swift
//  douyuzb
//
//  Created by mac on 2017/10/23.
//  Copyright © 2017年 mac. All rights reserved.
//

import UIKit

class PageTitleView: UIView {

    //MARK:- 定义属性
    private var titles: [String]
    
    
    // 懒加载ScrollView
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop = false
        scrollView.isPagingEnabled = false
        scrollView.bounces = false
        return scrollView
    }()
    
    //MARK:- 自定义构造函数
    init(frame: CGRect, titles: [String]) {
        self.titles = titles
        
        super.init(frame: frame)
        
        //设置UI界面
        setupUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension PageTitleView{
    private func setupUI(){
        // 1. 添加UIScrollView
        addSubview(scrollView)
        scrollView.frame = bounds
        
        // 2. 添加title对应的Label
        setupTitleLabels()
    }
    
    private func setupTitleLabels(){
        for (index, title) in titles.enumerated() {
            //1. 创建UILabel
            
            let label = UILabel()
            
            //2. 设置label的属性
            label.text = title
            label.tag = index
            label.font = UIFont.systemFont(ofSize: 16.0)
            label.textColor = UIColor.darkGray
            label.textAlignment = .center
            
    
            
        }
    }
}
