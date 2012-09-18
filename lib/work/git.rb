module Work
  module Git
    BRANCH_PREFIX = "work_"
    def self.current_branch_name
      `git rev-parse --abbrev-ref HEAD`
    end

    def self.on_work_branch?
      current_branch_name =~ BRANCH_PREFIX
    end

    def self.create_branch(issue_id, issue_title)
      branch = "#{BRANCH_PREFIX}_#{issue_id}_#{issue_title}".underscore.downcase
      # Make it track to workflow
      source_branch = ENV['WORK_SOURCE_BRANCH'] || 'master'
      `git co #{source_branch}`
      `git co -b #{branch}`
      `git push -u #{self.git_remote} #{branch}`
    end

    def self.git_remote
      Work::Configuration.config_options[:git_remote]
    end
  end
end
