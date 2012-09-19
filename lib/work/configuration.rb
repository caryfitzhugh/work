require 'yaml'

module Work
  class Configuration
    DATA_FILE = ".work"
    OPTIONS = {
       :pivotal_key         => "update",
       :pivotal_project_id  => "607607",
       :pivotal_username    => "update",
       :github_repository   => "ziplist",
       :github_credentials  => "user:pass",
       :pull_target         => "Ziplist:ziplist/master",
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
    def self.pull_target_repository_name
      self.pull_target.split(":").second.split("/").first
    end

    def self.pull_target_branch
      self.pull_target.split(":").second.split("/").second
    end

    def self.pull_target_user
      self.pull_target.split(":").first
    end

    def self.github_user
      self.github_credentials.split(":").first
    end

    def self.save_options(options)
      File.open(DATA_FILE, 'w') do |f|
        YAML::dump(options, f)
      end
    end
  end
end
