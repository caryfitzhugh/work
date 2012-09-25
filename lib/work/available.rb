module Work
  module Available
    def self.execute(args)
      puts "These are the tasks you are on:"
      self.show_current

      puts "These are some available tasks:"
      self.show_available
    end

    def self.show_available
      Work::Pivotal.stories.slice(0,5).each do |story|
        binding.pry
        puts "#{story.id}) #{story.title}"
        puts "    #{story.url}"
      end
    end

    def self.show_current
      Work::Git.all_work_branches.each do |branch|
        id, title =  Work::Git.from_branchname(branch)
        puts "#{id}) #{title}"
      end
    end
  end
end
