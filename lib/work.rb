require "work/version"

module Work
  def self.run(command, args)
    case command.downcase
    when 'setup'
      Work::Setup.execute(command, args)
    else
      puts "Huh?"
    end
  end
end
