Pod::Spec.new do |spec|
  spec.name = 'WebLinking'
  spec.version = '0.1.0'
  spec.summary = 'Swift implementation of Web Linking and Link headers (RFC5988)'
  spec.homepage = 'https://github.com/kylef/WebLinking.swift'
  spec.license = { :type => 'MIT', :file => 'LICENSE' }
  spec.author = { 'Kyle Fuller' => 'inbox@kylefuller.co.uk' }
  spec.social_media_url = 'http://twitter.com/kylefuller'
  spec.source = { :git => 'https://github.com/kylef/WebLinking.swift.git', :tag => "#{spec.version}" }
  spec.source_files = 'WebLinking/*.{h,swift}'
  spec.ios.deployment_target = '8.0'
  spec.osx.deployment_target = '10.9'
  spec.requires_arc = true
end

