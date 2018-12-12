Pod::Spec.new do |s|

  s.name         = "YXYBaseTool"
  s.version      = "0.2.4"
  s.summary      = "常用工具及宏定义等。"
  s.description  = <<-DESC
  避免每次新建工程一个个导入
                   DESC

  s.homepage     = "https://github.com/amosYin/YXYBaseTool"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"

  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }

  s.author             = { "Amos" => "1453254169@qq.com" }

  s.source       = { :git => "https://github.com/amosYin/YXYBaseTool.git", :tag => "#{s.version}" }

  s.source_files  = "Classes/*.{h,m}"
  #s.exclude_files = "Classes/Exclude"
  s.requires_arc = true
  s.platform     = :ios,'8.0'
  s.libraries = 'c++.1'
  s.frameworks = 'UIKit','Foundation','WebKit'
  s.dependency 'MBProgressHUD'
  s.dependency 'Masonry'
end
