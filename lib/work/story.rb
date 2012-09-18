module Work
  class Story
    def self.find(id)
      story_record = Work::Pivotal.find_story
      Story.new(:title => story_record.title, :id => story_record.id)
    end

    attr_accessor :title, :id
    def initialize(args = {})
      @title = args[:title]
      @id    = args[:id]
    end
  end
end
