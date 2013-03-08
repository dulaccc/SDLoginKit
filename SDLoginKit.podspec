Pod::Spec.new do |s|
  s.name     = 'SDLoginKit'
  s.version  = '0.0.1'
  s.license  = 'MIT'
  s.summary  = 'Login/Sign-Up ViewControllers Ready-To-Use with your Custom Backend.'
  s.homepage = 'https://github.com/stevederico/SDLoginKit'
  s.authors  = { 'Steve Derico' => 'Steve@bixbyapps.com' }
  s.source   = { :git => 'https://github.com/dulaccc/SDLoginKit.git', :commit => '25e0464', :submodules => true }
  s.requires_arc = true

  # Temporary add the SDKit dependency this way, waiting the SDKit pod to be ready :)
  s.source_files = 'SDLoginKit/**/*.{h,m}'

  s.subspec 'SDKit' do |sdkit|
    sdkit.source_files = 'SDKit/**/*.{h,m}'
    sdkit.resources = 'SDKit/**/Assets/*.png'
  end

  s.platform = :ios, '5.0'
end