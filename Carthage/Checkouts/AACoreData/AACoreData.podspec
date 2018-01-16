
Pod::Spec.new do |s|
s.name             = 'AACoreData'
s.version          = '1.0.1'
s.summary          = 'AACoreData is a lightweight data persistence wrapper designed to provide an easier solution for `CRUD` operations using CoreData in Swift.'

s.description      = <<-DESC
AACoreData is a lightweight data persistence wrapper designed to provide an easier solution for `CRUD` operations using `CoreData`, written in Swift. It provides a singleton instance to access `CoreData` objects anywhere in the code and uses 'value types' to define `CoreData` entities.
DESC

s.homepage         = 'https://github.com/EngrAhsanAli/AACoreData'
# s.screenshots     = 'www.example.com/demo.gif'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'Engr. Ahsan Ali' => 'hafiz.m.ahsan.ali@gmail.com' }
s.source           = { :git => 'https://github.com/EngrAhsanAli/AACoreData.git', :tag => s.version.to_s }

s.pod_target_xcconfig = { 'SWIFT_VERSION' => '3.0' }

s.ios.deployment_target = '8.0'

s.source_files = 'AACoreData/Classes/**/*'

end
