Pod::Spec.new do |s|

  s.name         = "LPSliderView"
  s.version      = "1.1.0"
  s.summary      = "自定义分段标签滚动视图-Swift"
  #s.description  = ""
    
  s.homepage     = "https://github.com/splsylp/LPSliderView"
  s.license      = "MIT"
  s.author       = { "Tony" => "961505161@qq.com" }

  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/splsylp/LPSliderView.git", :tag => "1.1.0" }
  s.source_files = "LPSliderView/Source/*.swift"
  
  s.frameworks = "UIKit"
  s.requires_arc = true

end
