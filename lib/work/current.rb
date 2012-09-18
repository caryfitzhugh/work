module Work
  module Current
    def self.execute(args)
      Work::Git.all_work_branches
    end
  end
end
