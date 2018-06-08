#
#  Be sure to run `pod spec lint ChartDynamicKit.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "ChartDynamicKit"
  s.version      = "0.0.1"
  s.summary      = "Easily Create Hyper-Minimal Dynamic Charts"

  s.homepage     = "https://github.com/stevewight/ChartDynamicKit"
  s.license      = "MIT"
  s.author       = { "Steve Wight" => "stevendouglaswight@gmail.com" }
  s.platform     = :ios, "11.0"

  s.source       = { :git => "https://github.com/stevewight/ChartDynamicKit.git", :tag => "#{s.version}" }

  s.source_files = "ChartDynamicKit/**/*.{h,m,swift}"
  s.pod_target_xcconfig = { "SWIFT_VERSION" => "4" }
  s.dependency "MinChartKit"

end
