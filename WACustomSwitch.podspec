#
#  Be sure to run `pod spec lint WACustomSwitch.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "WACustomSwitch"
  s.version      = "1.0"
  s.authors      = { "Wendy Abrantes" => "abranteswendy@gmail.com" }
  s.homepage     = "https://github.com/wendyabrantes/WACustomSwitch"
  s.summary      = "Swift Library using Core Animation to make custom switch"
  s.source       = { :git => "https://github.com/wendyabrantes/WACustomSwitch.git",
                     :tag => '1.0' }
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.platform = :ios, '8.0'
  s.source_files = "WACustomSwitch/**/*.swift"

  s.requires_arc = true
  
  s.dependency 'pop'
  s.ios.deployment_target = '8.0'
  s.ios.frameworks = ['UIKit', 'Foundation']
end