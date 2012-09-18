module Work
  module Create
    def self.execute(args)
      # Find out which issue to do
      story = Work::Utils.get_story(args.first)

      Work::Git.find_or_create_branch(story.id, story.name)
    end
  end
end
