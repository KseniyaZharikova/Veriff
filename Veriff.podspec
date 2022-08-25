Pod::Spec.new do |s|

# 1
s.platform = :ios
s.ios.deployment_target = '14.0'
s.name = "Veriff"
s.summary = "Veriff lets a user detect face and documents."
s.requires_arc = true

# 2
s.version = "0.1.0"

# 3
s.license = { :type => "MIT", :file => "LICENSE" }

# 4 - Replace with your name and e-mail address
s.author = { "KseniyaZharikova" => "kseniya.zharikova.viktorovna@gmail.com" }

# 5 - Replace this URL with your own GitHub page's URL (from the address bar)
s.homepage = "https://github.com/KseniyaZharikova/Veriff"

# 6 - Replace this URL with your own Git URL from "Quick Setup"
s.source = { :git => "https://github.com/KseniyaZharikova/Veriff.git",
             :tag => "#{s.version}" }

# 7
s.framework = "UIKit"
s.dependency 'SnapKit'

# 8
s.source_files = "Veriff/**/*.{swift,h,m,xib,storyboard}"

# 9
s.resources = "Veriff/**/*.{png,jpeg,jpg,storyboard,xib,xcassets}"

s.resource_bundles = {
    'Veriff' => ['Pod/Classes/**/*.{storyboard,xib,xcassets,json,imageset,png}']
  }

s.exclude_files = "Classes/Exclude"

# 10
s.swift_version = "4.2"
end
