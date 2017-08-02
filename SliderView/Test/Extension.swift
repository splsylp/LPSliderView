//
//  Extension.swift
//  SliderView
//
//  Created by Tony on 2017/8/2.
//  Copyright © 2017年 Tony. All rights reserved.
//

import UIKit

import UIKit

extension UIView {
    
    public var x: CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            var frame = self.frame
            frame.origin.x = newValue
            self.frame = frame
        }
    }
    
    public var y: CGFloat{
        get {
            return self.frame.origin.y
        }
        set {
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
    }
    
    /** 宽 */
    public var width: CGFloat{
        get {
            return self.frame.size.width
        }
        set {
            var frame = self.frame
            frame.size.width = newValue
            self.frame = frame
        }
    }
    
    /** 高 */
    public var height: CGFloat{
        get {
            return self.frame.size.height
        }
        set {
            var frame = self.frame
            frame.size.height = newValue
            self.frame = frame
        }
    }
    
    /** 下 */
    public var bottom: CGFloat{
        get {
            return self.frame.origin.y + self.frame.size.height
        }
        
        set {
            var frame = self.frame
            frame.origin.y = newValue - self.frame.size.height
            self.frame = frame
        }
    }
    
    /** 右 */
    public var right: CGFloat{
        get {
            return self.frame.origin.x + self.frame.size.width
        }
        
        set {
            var frame = self.frame
            frame.origin.x = newValue - self.frame.size.width
            self.frame = frame
        }
    }
    
    /** 尺寸 */
    public var size: CGSize{
        get {
            return self.frame.size
        }
        
        set {
            var frame = self.frame
            frame.size = newValue
            self.frame = frame
        }
    }
    
    /** 竖直中心对齐 */
    public var centerX: CGFloat{
        get {
            return self.center.x
        }
        
        set {
            var center = self.center
            center.x = newValue
            self.center = center
        }
    }
    
    /** 水平中心对齐 */
    public var centerY: CGFloat{
        get {
            return self.center.y
        }
        
        set {
            var center = self.center
            center.y = newValue
            self.center = center
        }
    }
    
}


extension UIColor {
    
    class var MainColor: UIColor {
        return UIColor(red: 74/255.0, green: 163/255.0, blue: 243/255.0, alpha: 1.0)
    }
    
    class var LineColor: UIColor {
        return UIColor(red: 221.0/255.0, green: 221.0/255.0, blue: 221.0/255.0, alpha: 1.0)
    }
    
    class var GrayColor: UIColor {
        return UIColor(red: 242/255.0, green: 243/255.0, blue: 248/255.0, alpha: 1.0)
    }
    
}
