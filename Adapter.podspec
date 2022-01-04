#
#  Be sure to run `pod spec lint Adapter.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name         = "Adapter"
  spec.version      = "0.0.2"
  spec.summary      = "MVVM and network layer skeleton source code"
  spec.homepage     = "https://github.com/amit-bhavsar"
  spec.license      = { :type => "None", :text => "No licence" }
  spec.author       = { "Amit" => "amitbhavsar@live.com" }
  spec.platform     = :ios, '13.0'
  spec.swift_version    =    '5.0'
  spec.source       = { :git => "git@github.com:amit-bhavsar/Adapter.git", :tag => spec.version.to_s }
  spec.source_files  = "Sources/**/*.{h,m,swift}"
  spec.exclude_files = "Example/*.*"
  spec.framework  = "Combine"
  spec.dependency 'Alamofire', '~> 5.5.0'

end
