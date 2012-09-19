jmodule Work
  module Git
    BRANCH_PREFIX = "work_"


    def self.push_current
      `git push`
    end

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

    def self.create_branch(story)
      branch = self.to_branchname(story)
      # Make it track to workflow
      source_branch = ENV['WORK_SOURCE_BRANCH'] || 'master'
      `git co #{source_branch}`
      `git co -b #{branch}`
      `git push -u #{self.git_remote} #{branch}`
    end

    def self.git_remote
      Work::Github.remote_name
    end

    def self.add_remote
      url = Work::Github.remote_url
      name = Work::Github.remote_name
      `git remote add -f #{name} #{url}`
    end

    def self.to_branchname(story)
      "#{BRANCH_PREFIX}_#{story.id}_#{story.name}".underscore.downcase
    end

    def self.from_branchname(branchname)
      id, title = branchname.gsub(/^#{BRANCH_PREFIX}/,'').split('_', 2)
      title = (title || "**no title**").gsub("_", " ")
      [id, title]
    end
  end
end
