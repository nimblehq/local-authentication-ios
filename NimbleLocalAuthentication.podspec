#
# Be sure to run `pod lib lint NimbleLocalAuthentication.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name = 'NimbleLocalAuthentication'
  s.version = '1.0.1'
  s.summary = 'A SDK support local authentication.'
  s.homepage = 'https://github.com/nimblehq/local-authentication-ios'
  s.license = { :type => 'MIT', :file => 'LICENSE' }
  s.author = { '@nimblehq' => 'su.v@nimblehq.co' }
  s.source = { :git => 'https://github.com/nimblehq/local-authentication-ios.git', :tag => s.version.to_s }
  s.ios.deployment_target = '11.0'
  s.source_files = 'Sources/Classes/**/*'
  s.swift_version = '5.0'
  s.framework = 'LocalAuthentication'
  s.dependency 'KeychainAccess'
end
