#
# Be sure to run `pod lib lint PopUpViewAlert.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'PopUpViewAlert'
  s.version          = '0.1.0'
  s.summary          = 'This is a framework that will be a lot useful'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
This library will popup some a view where you can set the context of the view, it can be a successful popupview with a message to let you know what the user have done. It can also be a warnning or a error.
                       DESC

  s.homepage         = 'https://github.com/Coimbraa/PopUpViewAlert'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Daniel Coimbra' => 'daniel.alexandrecoimbra@gmail.com' }
  s.source           = { :git => 'https://github.com/Coimbraa/PopUpViewAlert.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'PopUpViewAlert/Classes/**/*'
  
   s.resource_bundles = {
     'PopUpViewAlert' => ['PopUpViewAlert/Assets/*.png']
   }

  # s.public_header_files = 'Pod/Classes/**/*.h'
   s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
