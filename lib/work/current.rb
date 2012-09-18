module Work
  module Current
    def self.execute(args)
      pp Work::Git.all_work_branches
    end
  end
end
