# SliderView
#### 自定义分段标签滚动视图，集成使用简单。便于更改分段标题头部样式，支持默认选中及更改选中某个视图，解决滚动视图跟其他滑动手势冲突问题。

![image](https://github.com/splsylp/SliderView/blob/master/SliderView.gif )

#### 实现功能
* 支持默认选中及更改选中某个视图
* 解决滚动视图跟其他滑动手势冲突问题
* 外部调用样式属性多，便于更改分段标题头部样式

---

### 使用
#### 初始化
```Swift
let one = OneController()
let two = TwoController()
let three = ThreeController()
addChildViewController(one)
addChildViewController(two)
addChildViewController(three)

let sliderView = SliderView(frame: sliderFrame, titles: ["今天", "天气", "不错"], contentViews: [one.view, two.view, three.view])
view.addSubview(sliderView)
```

#### 手动切换当前被选中的滚动视图
在某些情景下，比如初始化时，或者跳转到内页返回后，需要更改当前被选中的视图，这时可以调用该属性进行切换
```Swift
sliderView.selectedIndex = 1 // 选中第2个视图
```


#### 外部调用属性
```Swift
/// 当前被选中视图下标
public var selectedIndex = 0 

/// 头部标题视图高度
public var topViewHeight = 50
/// 标题按钮字体大小
public var btnFontSize: CGFloat = 17
/// 标题按钮字体颜色（普通状态）
public var btnFontColorNormal = UIColor.black
/// 标题按钮字体颜色（选中状态）
public var btnFontColorSelected = UIColor.MainColor
/// 分割线颜色
public var lineColor = UIColor.LineColor
/// 分割线大小(宽度或高度)
public var lineSize: CGFloat = 1
/// 底部滑条颜色
public var sliderColor = UIColor.MainColor
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
```
---
### 您的star，是对我最大的鼓励与支持~
