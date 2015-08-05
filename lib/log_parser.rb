require_relative 'log_entry'

# Parse the logfile splitting each line up into URL and IP. Exposes only
# a single method - LogParser.parse
class LogParser
  class << self
    def parse(filename, &block)
      fail "logfile #{filename} not found" unless File.exist? filename

      File.open(filename, 'r').each_line { |line| LogEntry.parse(line, &block) }
    end
  end
end
