#
# Be sure to run `pod lib lint DCTypography.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "DCTypography"
  s.version          = "0.1.0"
  s.summary          = <<-DESC
                        DCTypography is a simple and user-friendly tool designed for reconciliation of developers and designers :)
                        DESC

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = "With DCTypography you can create a typographic styles when it's convenient to you, add them to the shared storage and use when needed. You need just specify typographic parameters."

  s.homepage         = "https://github.com/Galeas/DCTypography"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Evgeniy Branitsky" => "akki12091987@gmail.com" }
  s.source           = { :git => "https://github.com/Galeas/DCTypography.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  # s.resource_bundles = {
  #   'DCTypography' => ['Pod/Assets/*.png']
  # }
end
