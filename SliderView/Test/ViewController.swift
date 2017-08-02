//
//  ViewController.swift
//  SliderView
//
//  Created by Tony on 2017/8/2.
//  Copyright © 2017年 Tony. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var sliderView: SliderView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let one = OneController()
        let two = TwoController()
        let three = ThreeController()
        addChildViewController(one)
        addChildViewController(two)
        addChildViewController(three)
        
        sliderView = SliderView(frame: CGRect(x: 0, y: 64, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 64), titles: ["今天", "天气", "不错"], contentViews: [one.view, two.view, three.view])
        sliderView.selectedIndex = 1 // 默认选中第2个
        view.addSubview(sliderView)
        
        NotificationCenter.default.addObserver(self, selector: #selector(changeSliderView), name: NSNotification.Name(rawValue: "change"), object: nil)
    }
    
    // 切换滚动视图
    func changeSliderView() {
        
        sliderView.selectedIndex = 0
    }
}

