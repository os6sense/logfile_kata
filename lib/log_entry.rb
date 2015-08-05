# Represents a single entry in the log file and corresponds to the parsed
# content of a single line. The +parse+ class method can be used to create
# new LogEntry
class LogEntry
  attr_accessor :url,
                :ip

  def initialize(url, ip)
    @url, @ip = url, ip
  end

  class << self
    # Given a string in the format <url> <ip> (e.g /home 451.106.204.921) will
    # split this into its components and yield a new LogEntry
    def parse(line)
      line.split(' ').tap { |url, ip| yield LogEntry.new(url, ip) }
    end
  end
end
