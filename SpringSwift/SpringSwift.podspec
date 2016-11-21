Pod::Spec.new do |s|
    s.name         = “SpringSwift”
    s.version      = "0.0.1"
    s.summary      = '测试库程序'
    s.homepage     = "https://github.com/letianfu/SpringSwift"
    s.license      = 'MIT'
    s.author       = {'kbo' => ‘15281060106@163.com'}
    s.source       = { :git => 'https://github.com/letianfu/SpringSwift.gt’}
    s.platform     = :ios
    s.source_files = 'SpringSwift/**/*.swift'
    s.resources    = 'SpringSwift/**/*.{png,xib,storyboard}'
end