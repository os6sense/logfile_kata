# Parse command line arguments. Exposes a single method, +parse+ which returns
# a hash of parsed valid options. If the arguments do not match the expected
# format, +parse+ exits
class OptionsParser
  class << self
    # Parse the command line arguments returning a hash of parse options. If
    # the arguments are invalid for any reason, parse will call exit.
    #
    # === PARAMS
    # +args+:: expect to be an array the command line arguments provided
    #          to the program i.e. ARGV
    def parse(args)
      show_usage unless args.length == 1
      return { filename: args[0] }
    end

    private

    def show_usage
      puts "Usage: parser <filename>\ne.g parser logfile.log"
      exit(1)
    end
  end
end


