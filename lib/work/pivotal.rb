module Work
  module Pivotal
    def self.stories
      self.project.stories.all
    end

    def self.find_story(id)
      self.project.stories.find(id)
    end

    def self.project
      if !@project
        PivotalTracker::Client.token = Work::Configuration.config_options[:pivotal_key]
        @project = PivotalTracker::Project.find(Work::COnfiguration.config_options[:pivotal_project_id])
      end
      @project
    end

  end
end
