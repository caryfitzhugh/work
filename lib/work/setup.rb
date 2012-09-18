module Work
  module Setup
    def self.execute(command, args)
      puts "Setup Work..."
      new_options = {}
      Work::Configuration.config_options.each_pair do |name, value|
        puts "#{name}  (#{value}):"
        input = gets
        if (input.blank?)
          new_options[name] = value
        else
          new_options[name] = input
        end
      end
      puts "Configuration Completed..."
    end
  end
end
