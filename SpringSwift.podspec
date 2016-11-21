Pod::Spec.new do |s|
    s.name         = "SpringSwift"
    s.version      = “0.0.8”
    s.summary      = '测试库程序'
    s.homepage     = "https://github.com/letianfu/SpringSwift"
    s.license      = 'MIT'
    s.author       = {'letianfu' => '15281060106@163.com'}
    s.source       = { :git => 'https://github.com/letianfu/SpringSwift.git'}
    s.platform     = :ios
    s.source_files = 'SpringSwift/SpringSwift/Export/**/*.swift'
    s.resources    = 'SpringSwift/**/*.{png,xib,storyboard}'
end