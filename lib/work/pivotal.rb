require 'pivotal-tracker'

module Work
  module Pivotal
    module StoryExtension
    end
    def self.stories
      self.project.stories.all.map do |story|
        story.extend StoryExtension
        story
      end
    end

    def self.find_story(id)
      story = self.project.stories.find(id)
      story.extend StoryExtension
      story
    end

    def self.project
      if !@project
        PivotalTracker::Client.token = Work::Configuration.config_options[:pivotal_key]
        @project = PivotalTracker::Project.find(Work::Configuration.config_options[:pivotal_project_id])
      end
      @project
    end

  end
end
