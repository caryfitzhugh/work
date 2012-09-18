module Work
  module Utils

    def self.get_issue_id_and_title(arg)
      if arg
        if issue = Work::Issue.find(arg)
          issue
        else
          puts "That is not a valid issue id"
          Work::Pivotal.select_issue(arg)
        end
      else
        Work::Pivotal.select_issue(arg)
      end
    end
  end
end
