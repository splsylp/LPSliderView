//
//  XibDemoController.swift
//  SliderView
//
//  Created by Tony on 2017/8/18.
//  Copyright © 2017年 Tony. All rights reserved.
//

import UIKit

class XibDemoController: UIViewController {

    @IBOutlet weak var sliderView: SliderView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let one = OneController()
        let two = TwoController()
        addChildViewController(one)
        addChildViewController(two)
        
        sliderView.titleNormalColor = UIColor.orange
        sliderView.titleSelectedColor = UIColor.green
        sliderView.sliderColor = UIColor.green
        sliderView.sliderWidth = 60
        sliderView.sliderHeight = 2
        
        sliderView.titles = ["One", "Two"]
        sliderView.contentViews = [one.view, two.view]
    }

}
