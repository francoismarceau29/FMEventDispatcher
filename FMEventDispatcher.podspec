#
# Be sure to run `pod lib lint FMEventDispatcher.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "FMEventDispatcher"
  s.version          = "0.1.0"
  s.summary          = "More to come."
  s.description      = "Event dispatcher for iOS"
  s.homepage         = "https://github.com/francoismarceau29/FMEventDispatcher"
  s.license          = 'MIT'
  s.author           = { "Frank Marceau" => "franksup2@gmail.com" }
  s.source           = { :git => "https://github.com/francoismarceau29/FMEventDispatcher.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/franksup2'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
end
