# SliderView
#### 自定义分段标签滚动视图，集成使用简单。

### 实现功能
* 支持默认选中及更改选中某个视图
* 实现视图切换后闭包回调
* 解决滚动视图跟其他滑动手势冲突问题
* 外部调用样式属性多，便于更改分段标题头部样式
* 支持storyboard、xib方式加载视图

![image](https://github.com/splsylp/SliderView/blob/master/SliderView.gif )

---

### 使用
##### 初始化
###### 1）代码加载
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

###### 2）storyboard、xib加载
```Swift
1、在视图上添加一个UIView，并设置类为SliderView，然后把视图关联到代码中
2、配置视图属性
sliderView.titles = ["One", "Two"]
sliderView.contentViews = [one.view, two.view]
```

#### 手动切换当前被选中的滚动视图
在某些情景下，比如初始化时，或者跳转到内页返回后，需要更改当前被选中的视图，这时可以调用该属性进行切换
```Swift
sliderView.selectedIndex = 1 // 选中第2个视图
```

#### 切换视图后的回调
在点击或滑动切换视图后，如果在最外层的控制器中需要做一些操作时，可以使用这个闭包回调方法。
```Swift
// 视图切换闭包回调（可选）
sliderView.viewChangeClosure = { index in
    print("视图切换，下标---", index)
}
```


#### 外部调用属性
```Swift
/// 视图切换闭包回调
public var viewChangeClosure: ((Int) -> Void)?
/// 视图标题数组
public var titles = [String]()
/// 视图数组
public var contentViews = [UIView]()
/// 当前被选中视图下标
public var selectedIndex = 0 

/// 头部标题视图高度
public var topViewHeight = 50
/// 标题按钮字体大小
public var titleFontSize: CGFloat = 17
/// 标题按钮字体颜色（普通状态）
public var titleNormalColor = UIColor.black
/// 标题按钮字体颜色（选中状态）
public var titleSelectedColor = UIColor.MainColor
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

#### 更新记录
- 1.0.0 
  - 基本功能实现
- 1.1.0 
  - 增加storyboard方式加载视图
  - 增加视图切换闭包回调
---

### 您的star，是对我最大的鼓励与支持~
