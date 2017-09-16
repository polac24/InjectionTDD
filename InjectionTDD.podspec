Pod::Spec.new do |s|
  s.name             = 'InjectionTDD'
  s.version          = '0.1.0'
  s.summary          = 'TDD test support'
  s.platform         = :ios
  s.description      = <<-DESC
This library allows hanging Xcode unit tests in order to
let injectionforxcode tool ability to live update codes and its
unit tests.

This library has sense to work only with injectionforxcode to
give full TDD experience.
                       DESC

  s.homepage         = 'https://github.com/polac24/InjectionTDD'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Bartosz Polaczyk' => 'polac24@gmail.com' }
  s.source           = { :git => 'https://github.com/polac24/InjectionTDD.git', :tag => s.version.to_s }
   s.social_media_url = 'https://twitter.com/norapsi>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'InjectionTDD/Classes/**/*'

  s.frameworks = 'XCTest'
end