require 'yaml'

module Work
  class Configuration
    DATA_FILE = ".work"
    OPTIONS = {
       :pivotal_key         => "update",
       :pivotal_project_id  => "607607",
       :pivotal_username    => "update",
       :github_user         => "caryfitzhugh",
       :github_repository   => "ziplist",
       :github_credentials  => "user:pass",
       :irc                 => 'http://ziplist@ziplistrocks:fragglerock.ziplist.com:8080/'
     }

    def self.method_missing(method, args)
      self.config_options(method)
    end

    def self.config_options
      if File.exist?(DATA_FILE)
        OPTIONS.merge(YAML::load_file(DATA_FILE) || {})
      else
        OPTIONS
      end
    end
    def self.save_options(options)
      File.open(DATA_FILE, 'w') do |f|
        YAML::dump(options, f)
      end
    end
  end
end
