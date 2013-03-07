Pod::Spec.new do |s|
  s.name     = 'SDLoginKit'
  s.version  = '0.0.1'
  s.license  = 'MIT'
  s.summary  = 'Login/Sign-Up ViewControllers Ready-To-Use with your Custom Backend.'
  s.homepage = 'https://github.com/stevederico/SDLoginKit'
  s.authors  = { 'Steve Derico' => 'Steve@bixbyapps.com' }
  s.source   = { :git => 'https://github.com/stevederico/SDLoginKit.git', :tag => '0.0.1' }
  s.requires_arc = true

  # Temporary add the SDKit dependency this way, waiting the SDKit pod to be ready :)
  s.source_files = 'SDLoginKit', 'SDKit/SDKit'
  s.resources = 'SDKit/SDKit/Assets'

  s.platform = :ios, '5.0'
  # s.dependency 'SDKit' 
end