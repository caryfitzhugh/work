module Work
  module Create
    def self.execute(args)
      # Find out which issue to do
      issue_id, title = Work::Utils.get_issue_id_and_title(args.first)

      Work::Git.find_or_create_branch(issue_id, title)
    end
  end
end
