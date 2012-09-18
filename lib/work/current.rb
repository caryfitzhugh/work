module Work
  module Current
    def self.execute(args)
      puts "These are the current tasks you are on:"
      Work::Git.all_work_branches.each do |branch|
        id, title =  Work::Git.from_branchname(branch)
        puts "#{id}) #{title}"
      end
    end
  end
end
