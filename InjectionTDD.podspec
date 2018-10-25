Pod::Spec.new do |s|
  s.name             = 'InjectionTDD'
  s.version          = '0.5.1'
  s.summary          = 'TDD test support'
  s.platform         = :ios
  s.description      = <<-DESC
This library allows to freeze Xcode unit tests in order to
let injectionforxcode tool ability to live update implementation code 
and its unit tests.

This library has sense to work only with injectionforxcode to
give full TDD experience.
                       DESC

  s.homepage         = 'https://github.com/polac24/InjectionTDD'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Bartosz Polaczyk' => 'polac24@gmail.com' }
  s.source           = { :git => 'https://github.com/polac24/InjectionTDD.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/norapsi'

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.11'
  s.tvos.deployment_target = '9.2'

  s.source_files = 'InjectionTDD/Classes/**/*'
  s.pod_target_xcconfig = { 'GCC_GENERATE_DEBUGGING_SYMBOLS' => 'NO' }
  s.frameworks = 'XCTest'
end
