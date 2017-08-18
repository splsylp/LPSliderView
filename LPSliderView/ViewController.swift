//
//  ViewController.swift
//  LPSliderView
//
//  Created by Tony on 2017/8/2.
//  Copyright © 2017年 Tony. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var sliderView: LPSliderView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let one = OneController()
        let two = TwoController()
        let three = ThreeController()
        addChildViewController(one)
        addChildViewController(two)
        addChildViewController(three)
        
        let frame = CGRect(x: 0, y: 64, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 64)
        let titles = ["今天", "天气", "不错"]
        let contentViews: [UIView] = [one.view, two.view, three.view]
        
        // 初始化方式一：（推荐）
        sliderView = LPSliderView(frame: frame, titles: titles, contentViews: contentViews)
        
        // 初始化方式二：
//        sliderView = LPSliderView()
//        sliderView.frame = frame
//        sliderView.titles = titles
//        sliderView.contentViews = contentViews
        
        // 视图切换闭包回调（可选。。。）
        sliderView.viewChangeClosure = { index in
            print("视图切换，下标---", index)
        }
        
        sliderView.selectedIndex = 1 // 默认选中第2个
        view.addSubview(sliderView)
        
        
        // 测试selectedIndex属性赋值
        NotificationCenter.default.addObserver(self, selector: #selector(changeSliderView), name: NSNotification.Name(rawValue: "change"), object: nil)
    }
    
    // 切换滚动视图
    func changeSliderView() {
        
        sliderView.selectedIndex = 0
    }
}

