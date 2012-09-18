module Work
  module Utils

    def self.get_story_id_and_title(arg)
      if arg
        if issue = Work::Pivotal.find_story(arg)
          issue
        else
          puts "That is not a valid issue id"
          Work::Utils.select_story
        end
      else
        Work::Utils.select_story
      end
    end

    def self.select_story
      stories = Work::Pivotal.stories
      index = 0
      puts "Select the story:"
      input = -1
      while input.to_i < 0 || input.to_i > stories.index
        stories.each do |story|
          puts "#{index}) #{story.title}"
          puts "     #{story.url}"
          puts
        end
        input = gets
      end
      stories[index]
    end

  end
end
