module Work
  class Issue
    def self.find(id)
      issue_record = Work::Pivotal.find_issue
    end

    attr_accessor :title, :id
    def initialize

    end


  end
end
