module Work
  class Configuration
    OPTIONS = {
       :pivotal_key => "update",
       :pivotal_username => "update",
       :git_remote  => "working",
       :browser     => "chrome",
       :irc         => 'http://ziplist@ziplistrocks:fragglerock.ziplist.com:8080/'
     }

    def self.config_options
      if File.exist?(DATA_FILE)
        OPTIONS.merge(YAML::load_file(DATA_FILE))
      else
        raise "You need to run setup to configure your workflow"
      end
    end

    def self.save_options(options)
      File.open(DATA_FILE, 'w') do |f|
        f.write OPTIONS.merge(options).to_yaml
      end
    end
  end
end
