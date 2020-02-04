post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['ENABLE_BITCODE'] = 'NO'
            if config && config.base_configuration_reference
                xcconfig_path = config.base_configuration_reference.real_path
                #puts "file path is: #{xcconfig_path}"
                File.open(xcconfig_path, 'a+') do |file|
                    file.puts "#include \"#{File.realpath(File.join(framework_dir, 'Generated.xcconfig'))}\""
                end
            end
        end
    end
end