module Work
  module Utils

    def self.get_story_id_and_title(arg)
      if arg
        if issue = Work::Story.find(arg)
          issue
        else
          puts "That is not a valid issue id"
          Work::Pivotal.select_story
        end
      else
        Work::Pivotal.select_story
      end
    end
  end
end
