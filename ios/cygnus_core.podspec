#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutterplugintest.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'cygnus_core'
  s.version          = '0.0.1'
  s.summary          = 'A new Flutter plugin.'
  s.description      = <<-DESC
A new Flutter plugin.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'cygnus_core/Sources/cygnus_core/**/*.swift'
  s.resources = 'cygnus_core/Sources/cygnus_core/Resources/**/*.storyboard'
  s.dependency 'Flutter'
  s.resource_bundles = {'cygnus_core_privacy' => ['cygnus_core/Sources/cygnus_core/Resources/PrivacyInfo.xcprivacy']}

  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }

  s.libraries = 'swiftCoreGraphics'
  
  s.dependency 'swift-collections', '~>1.1.1'

  s.xcconfig = {
    'LIBRARY_SEARCH_PATHS' => '$(TOOLCHAIN_DIR)/usr/lib/swift/$(PLATFORM_NAME)/ $(SDKROOT)/usr/lib/swift',
    'LD_RUNPATH_SEARCH_PATHS' => '/usr/lib/swift',
  }

  s.swift_version = '5.0'

  s.platforms = { :ios => '15.0' }

  s.default_subspec = 'Core'

  s.subspec 'Core' do |core|
    core.platform = :ios, '15.0'
  end
end
