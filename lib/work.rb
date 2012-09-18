require "work/version"
require "work/setup"
require "work/configuration"
require "work/create"

module Work
  def self.run(command, args)
    case command.downcase
    when 'setup'
      Work::Setup.execute(command, args)
    when 'create'
      Work::Create.execute(command, args)
    else
      puts "Huh?"
    end
  end
end
