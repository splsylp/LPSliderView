//
//  ThreeController.swift
//  LPSliderView
//
//  Created by Tony on 2017/8/2.
//  Copyright © 2017年 Tony. All rights reserved.
//

import UIKit

class ThreeController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        let redBtn = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 100))
        redBtn.backgroundColor = UIColor.red
        redBtn.setTitle("切换至第一个视图", for: .normal)
        redBtn.addTarget(self, action: #selector(btnClicked), for: .touchUpInside)
        view.addSubview(redBtn)
    }
    
    func btnClicked() {
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "change"), object: self, userInfo: nil)
    }

}
