module Work
  module Create
    def self.execute(args)
      # Find out which issue to do
      #

      Work::Git.create_branch(issue_id, title)
    end
  end
end
