//
//  LPSliderView.swift
//  LPSliderView
//
//  Created by Tony on 2017/8/2.
//  Copyright © 2017年 Tony. All rights reserved.
//

import UIKit

public class LPSliderView: UIView, UIScrollViewDelegate {
    
    /// 视图切换闭包回调
    public var viewChangeClosure: ((Int) -> Void)?
    /// 视图标题数组
    public var titles = [String]()
    /// 视图数组
    public var contentViews = [UIView]()
    /// 当前被选中视图下标
    public var selectedIndex = 0 {
        didSet{
            if self.subviews.count > 0 {
                assert(selectedIndex < subViewCount, "下标越界！子视图并没有这么多！")
                changeView()
            }
        }
    }
    /// 头部标题视图高度
    public var topViewHeight = 50
    /// 标题按钮字体大小
    public var titleFontSize: CGFloat = 17
    /// 标题按钮字体颜色（普通状态）
    public var titleNormalColor = UIColor.black
    /// 标题按钮字体颜色（选中状态）
    public var titleSelectedColor = UIColor(red: 74/255.0, green: 163/255.0, blue: 243/255.0, alpha: 1.0)
    /// 分割线颜色
    public var lineColor = UIColor(red: 221.0/255.0, green: 221.0/255.0, blue: 221.0/255.0, alpha: 1.0)
    /// 分割线大小(宽度或高度)
    public var lineSize: CGFloat = 1
    /// 底部滑条颜色
    public var sliderColor = UIColor(red: 74/255.0, green: 163/255.0, blue: 243/255.0, alpha: 1.0)
    /// 底部滑条高度
    public var sliderHeight: CGFloat = 2
    /// 底部滑条宽度
    public var sliderWidth: CGFloat = 0
    
    /// 是否允许手动滑动滚动
    public var isAllowHandleScroll = true
    /// 是否使用弹簧效果
    public var isBounces = false
    /// 是否显示点击按钮缩放动画
    public var isShowBtnAnimation = true
    /// 是否显示按钮间的竖直分割线
    public var isShowVerticalLine = true
    /// 是否显示按钮底部的水平分割线
    public var isShowHorizontalLine = true
    
    private var subViewCount = 0 // 自视图个数
    private var BaseTag = 1000
    private var selectedBtn = UIButton() // 当前被选中的按钮
    private var topView = UIView() // 头部标题按钮视图
    private var sliderView =  UIView() // 底部滑条
    private var scrollView = RecognizerScrollView() // 滚动视图
    
    convenience init(frame: CGRect, titles: [String], contentViews: [UIView]) {
        self.init(frame: frame)
        self.titles = titles
        self.contentViews = contentViews
    }
    
    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        assert(titles.count == contentViews.count, "标题个数和自视图个数不相等！")
        assert(titles.count != 0, "自视图个数为0！")
        subViewCount = titles.count
        
        makeUI()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        makeUI()
    }
    
    
    private func makeUI() {
        
        if subViewCount == 0 {
            return
        }
        
        // 顶部视图
        maketopView()
        
        // 子视图
        addContentView()
    }
    
    // 标题按钮视图
    private func maketopView() {
        
        topView.frame = CGRect(x: 0, y: 0, width: Int(self.bounds.width), height: topViewHeight)
        topView.backgroundColor = UIColor.white
        self.addSubview(topView)
        
        // 标题按钮
        let btnW = topView.bounds.width / CGFloat(subViewCount)
        let btnH = topView.bounds.height
        for i in 0 ..< subViewCount {
            let btnX = CGFloat(i) * btnW
            let button = UIButton(frame: CGRect(x: btnX, y: 0, width: btnW, height: btnH))
            button.setTitle(titles[i], for: .normal)
            button.setTitleColor(titleNormalColor, for: .normal)
            button.setTitleColor(titleSelectedColor, for: .disabled)
            button.titleLabel?.font = UIFont.systemFont(ofSize: titleFontSize)
            button.tag = i + BaseTag
            button.addTarget(self, action: #selector(titleBtnClicked(btn:)), for: .touchUpInside)
            topView.addSubview(button)
            
            if i == selectedIndex { // 默认选中第一个按钮
                button.isEnabled = false
                selectedBtn = button
            }
            
            // 按钮之间竖直分割线
            if isShowVerticalLine {
                let lineView = UIView(frame: CGRect(x: button.frame.maxX, y: button.bounds.height * 0.2, width: lineSize, height: button.bounds.height * 0.6))
                lineView.backgroundColor = lineColor
                topView.addSubview(lineView)
            }
        }
        
        // 底部分割线
        if isShowHorizontalLine {
            let bottomLineView = UIView(frame: CGRect(x: 0, y: topView.bounds.height - lineSize, width: topView.bounds.width, height: lineSize))
            bottomLineView.backgroundColor = lineColor
            topView.addSubview(bottomLineView)
        }
        
        // 底部滑条
        let sliderViewW = sliderWidth == 0 ?  topView.bounds.width / CGFloat(subViewCount) : sliderWidth
        let sliderViewX = (btnW - sliderViewW) / 2.0
        sliderView.frame = CGRect(x: sliderViewX, y: topView.bounds.height - sliderHeight, width: sliderViewW, height: sliderHeight)
        sliderView.backgroundColor = sliderColor
        topView.addSubview(sliderView)
    }
    
    // 填充子视图
    private func addContentView() {
        
        scrollView.frame = CGRect(x: 0, y: topView.frame.maxY, width: self.bounds.width, height: self.bounds.height - topView.bounds.height)
        scrollView.delegate = self
        scrollView.backgroundColor = UIColor(red: 242/255.0, green: 243/255.0, blue: 248/255.0, alpha: 1.0)
        scrollView.bounces = isBounces
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isScrollEnabled = isAllowHandleScroll
        scrollView.contentSize = CGSize(width: self.bounds.width * CGFloat(subViewCount), height: 0)
        self.addSubview(scrollView)
        
        for i in 0 ..< subViewCount {
            let view = contentViews[i]
            let viewX = CGFloat(i) * scrollView.bounds.width
            view.frame = CGRect(x: viewX, y: 0, width: scrollView.bounds.width, height: scrollView.bounds.height)
            scrollView.addSubview(view)
        }
        scrollView.contentOffset = CGPoint(x: CGFloat(selectedIndex) * scrollView.bounds.width, y: 0)
    }
    
    
    // MARK:- 事件
    private func changeView() {
        
        if let btn = topView.viewWithTag(selectedIndex + BaseTag) {
            titleBtnClicked(btn: btn as! UIButton)
        }
    }
    
    // 标题按钮点击
    @objc private func titleBtnClicked(btn: UIButton) {
        
        if btn == selectedBtn {
            return
        }
        
        // 切换选中按钮
        changeSelectedBtn(btn: btn)
        
        // 视图滚动
        UIView.animate(withDuration: 0.25) {
            let num = btn.tag - self.BaseTag
            self.scrollView.contentOffset = CGPoint(x: self.scrollView.bounds.width * CGFloat(num), y: 0)
        }
    }
    
    // 滚动监听
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        // 滑条滚动
        let itemWidth = scrollView.bounds.width / CGFloat(subViewCount)
        let xoffset = (itemWidth / scrollView.bounds.width) * scrollView.contentOffset.x
        sliderView.transform = CGAffineTransform(translationX: xoffset, y: 0)
    }
    
    // 滚动结束
    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let index = Int(scrollView.contentOffset.x / scrollView.bounds.width)
        let btn = topView.viewWithTag(index + BaseTag) as! UIButton
        // 切换选中按钮
        changeSelectedBtn(btn: btn)
    }
    
    // 切换选中按钮
    private func changeSelectedBtn(btn: UIButton) {
        
        selectedBtn.isEnabled = true
        btn.isEnabled = false
        selectedBtn = btn
        
        // 按钮缩放动画
        if isShowBtnAnimation {
            scaleAnimationTitleBtn(btn: btn)
        }
        
        // 回调
        let index = btn.tag - BaseTag
        viewChangeClosure?(index)
    }
    
    // 按钮缩放动画
    private func scaleAnimationTitleBtn(btn: UIButton) {
        
        UIView.animate(withDuration: 0.25, animations: {
            btn.transform = CGAffineTransform(scaleX: 0.75, y: 0.75)
        }) { (finished) in
            UIView.animate(withDuration: 0.25, animations: {
                btn.transform = CGAffineTransform(scaleX: 1 / 0.9, y: 1 / 0.9)
            }, completion: { (finished) in
                UIView.animate(withDuration: 0.25, animations: {
                    btn.transform = CGAffineTransform.identity
                })
            })
        }
    }
}



/// 解决滚动视图跟页面的其他滑动手势(PanGuesture)冲突问题
class RecognizerScrollView: UIScrollView {
    
    override func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        
        if gestureRecognizer.isKind(of: UIPanGestureRecognizer.classForCoder()) {
            let pan = gestureRecognizer as? UIPanGestureRecognizer
            if ((pan?.translation(in: self).x) ?? 0 > CGFloat(0)) && (self.contentOffset.x == CGFloat(0)) {
                return false
            }
        }
        return super.gestureRecognizerShouldBegin(gestureRecognizer)
    }
}
