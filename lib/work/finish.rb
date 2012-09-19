module Work
  module Finish
    def self.execute(args)
      if Work::Git.on_work_branch?
        story_id, nil = Work::Git.from_branchname(Work::Git.current_branch_name)
        story = Work::Pivotal.find_story(story_id)
        if (story)
          # push to github.
          Work::Git.push_current
          pull_request = Work::Git.create_pull_request(story)
          story.update(:state => "finished",
        else
          puts "Doesn't seem to be a valid pivotal story"
        end
      else
        puts "Doesn't seem to be a pivotal story?"
      end
    end
  end
end
