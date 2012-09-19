require "work/version"
require "work/setup"
require "work/configuration"
require "work/create"
require "work/current"
require "work/git"
require "work/github"
require "work/pivotal"
require "work/utils"
require 'pp'

module Work
  def self.run(command, args)
    case command.downcase
    when 'setup'
      Work::Setup.execute(args)
    when 'current'
      Work::Current.execute(args)
    when 'create'
      Work::Create.execute(args)
    when 'finish'
      Work::Finish.execute(args)
    else
      # We show the current working branches...
      # And they pick the number to resume on.
    end
  end
end
