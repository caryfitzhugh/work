require "work/version"
require "work/setup"
require "work/configuration"
require "work/create"
require "work/git"

module Work
  def self.run(command, args)
    case command.downcase
    when 'setup'
      Work::Setup.execute(args)
    when 'create'
      Work::Create.execute(args)
    else
      puts "Huh?"
    end
  end
end
