module Work
  module Github

    def self.create_pull_request(story)
      target_repository = Work::Configuration.pull_target_repository_name
      target_branch     = Work::Configuration.pull_target_branch
      target_user       = Work::Configuration.pull_target_user

      puts "Create a pull request from this issue pointing at:"
      puts "user: #{target_user} - or enter a new one:"
      input = gets
      if (input.trim != '')
        target_user = input.trim
      end

      puts "repo: #{target_repository} - or enter a new one:"
      input = gets
      if (input.trim != '')
        target_repository = input.trim
      end

      puts "branch: #{target_branch} - or enter a new one:"
      input = gets
      if (input.trim != '')
        target_branch = input.trim
      end

      #  http://developer.github.com/v3/pulls/#create-a-pull-request
      self.github.repos.find(
        :user => target_user,
        :repo => target_repository
       ).pull_requests.create(
          title: story.name,
          body: "Put all the commits in here, for the differences, and add something on top about this being for pivotal issue X (with url)",
          base: target_branch,
          head: "#{self.remote_url}:#{Work::Git.to_branchname(story)}"
        )
    end

    def self.remote_name
      'work'
    end
    def self.remote_url
      self.repo.ssh_url
    end

    def self.repo
      repo = self.githubs.repos :user => Work::Configuration.github_user, :repo => Work::Configuration.github_repository
    end

    def self.github
      Github.new(:basic_auth => Work::Configuration.github_credentials)
    end
  end
end
