#
# Be sure to run `pod lib lint ZCUtils.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ZCUtils'
  s.version          = '1.0.0'
  s.summary          = 'ZCUtils Code'

  s.description      = <<-DESC
                       None ............... Code
                       DESC

  s.homepage         = 'http://gitlab.chuanyinet.com/basic-platform/iOS/ios-module/ZCUtils.git'
  s.license          = 'MIT'
  s.author           = { 'xxx' => 'xxx@palmpay-inc.com' }
  s.source           = { :git => 'git@gitlab.chuanyinet.com:basic-platform/iOS/ios-module/ZCUtils.git', :tag => s.version.to_s }
  
  # s.exclude_files = 'ZCUtils/Classes/Exclude'
  # s.pod_target_xcconfig = { 'VALID_ARCHS' => 'x86_64 armv7 arm64' }
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.ios.deployment_target = '12.0'
  s.swift_version = '5.0'
  s.static_framework = true

  s.source_files = 'ZCUtils/Classes/*.{h,m,swift}'
  s.resource_bundles = {
    'ZCUtils' => ['ZCUtils/Assets/*']
  }
  
  # ------------------------------------------------------------ #
  s.subspec 'A-Tool' do |tool|
    tool.source_files = 'ZCUtils/Classes/A-Tool/*.{h,m,swift}'
  end
  
  s.subspec 'B-Core' do |core|
    core.source_files = 'ZCUtils/Classes/B-Core/*.{h,m,swift}'
  end
  
  s.subspec 'C-Inherit' do |inherit|
    inherit.source_files = 'ZCUtils/Classes/C-Inherit/*.{h,m,swift}'
  end
  
  s.subspec 'D-Swizzle' do |swizzle|
    swizzle.source_files = 'ZCUtils/Classes/D-Swizzle/*.{h,m,swift}'
  end
  
  s.subspec 'E-Category' do |category|
    category.source_files = 'ZCUtils/Classes/E-Category/*.{h,m,swift}'
  end
  
  s.subspec 'F-Common' do |common|
    common.source_files = 'ZCUtils/Classes/F-Common/*.{h,m,swift}'
  end
  
  s.subspec 'G-Component' do |component|
    component.source_files = 'ZCUtils/Classes/G-Component/*.{h,m,swift}'
  end
  # ------------------------------------------------------------ #
  
  s.public_header_files = 'ZCUtils/Classes/*.h'
  
  # s.frameworks = 'UIKit', 'MapKit'
  
  # s.dependency 'LibTYTools', '~> 0.2'
  # s.dependency 'SnapKit'
end
