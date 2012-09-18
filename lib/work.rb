require "work/version"

module Work
  def self.run(command, args)
    switch command.downcase
      when 'setup'
        Work::Setup.execute(command, args)
      else
        puts "Huh?"
      end
    end
  end
end
