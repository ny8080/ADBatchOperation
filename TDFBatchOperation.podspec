Pod::Spec.new do |s|
  s.name         = "TDFBatchOperation"
  s.version      = "1.1.7"
  s.summary      = "basic TDFBatchOperation"

  s.description  = <<-DESC
  批量操作集，方便对集合类型进行操作
                   DESC

  s.homepage     = "http://git.2dfire.net/ios/TDFBatchOperation"

  s.license      = "LICENSE.md"
  s.author             = { "tripleCC" => "qingmu@2dfire.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "git@git.2dfire.net:ios/TDFBatchOperation.git", tag: s.version }


  tdfire_source_configurator = lambda do |s|
    s.source_files = 'TDFBatchOperation/Classes/*'
    s.public_header_files = 'TDFBatchOperation/Classes/*.h'

    s.dependency 'TDFCoreProtocol', '~> 1.0'
  end


  unless %w[tdfire_set_binary_download_configurations tdfire_source tdfire_binary].reduce(true) { |r, m| s.respond_to?(m) & r }
      
    tdfire_source_configurator.call s
  else
    s.tdfire_source tdfire_source_configurator
    s.tdfire_binary tdfire_source_configurator
    s.tdfire_set_binary_download_configurations
  end

end
