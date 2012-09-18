module Work
  module Git
    BRANCH_PREFIX = "work_"

    def self.all_work_branches
      branches = `git branch`.split("\n").map {|l| l.gsub(/\W/, "").strip }
      branches.select {|branch| branch =~ /^#{BRANCH_PREFIX}.+/ }
    end

    def self.current_branch_name
      `git rev-parse --abbrev-ref HEAD`
    end

    def self.on_work_branch?
      current_branch_name =~ BRANCH_PREFIX
    end

    def self.create_branch(issue_id, issue_title)
      branch = self.to_branchname(issue_id, issue_title)
      # Make it track to workflow
      source_branch = ENV['WORK_SOURCE_BRANCH'] || 'master'
      `git co #{source_branch}`
      `git co -b #{branch}`
      `git push -u #{self.git_remote} #{branch}`
    end

    def self.git_remote
      Work::Configuration.config_options[:git_remote]
    end

    def self.to_branchname(id, title)
      "#{BRANCH_PREFIX}_#{id}_#{title}".underscore.downcase
    end

    def self.from_branchname(branchname)
      id, title = branchname.gsub(/^#{BRANCH_PREFIX}/,'').split('_', 2)
      title = (title || "**no title**").gsub("_", " ")
      [id, title]
    end
  end
end
