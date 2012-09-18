module Work
  module Setup
    def self.execute(command, args)
      puts "Setup Work..."
      new_options = {}
      Work::Configuration.config_options.each_pair do |name, value|
        print "#{name}  (#{value}):  "
        input = gets
        if (input.strip == "")
          new_options[name] = value
        else
          new_options[name] = input.strip
        end
      end
      Work::Configuration.save_options(new_options)
      puts "Configuration Completed..."
    end
  end
end
