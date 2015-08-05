require_relative 'lib/log_file'
require_relative 'lib/log_parser'

class Parser
  def initialize(filename, autorun = true)
    @logfile = LogFile.new
    @filename = filename

    parse if autorun
  end

  def parse
    LogParser.parse(@filename) { |entry| @logfile.add(entry) }
  end

  def most_visted
    @logfile.sort_by { |_, v| v.count }.each do |url, entries|
      format('visits', url, entries.count)
    end
  end

  def unique_views
    @logfile.sort_by { |_, v| v.uniq(&:ip).count }.each do |url, entries|
      format('unique views', url, entries.uniq(&:ip).count)
    end
  end

  private

  def format(tail, url, count)
    puts sprintf('%-30s %d %s', url, count, tail)
  end
end

require_relative 'lib/options_parser'

def parse_file
  filename = OptionsParser.parse(ARGV)[:filename]
  parser = Parser.new(filename)

  parser.most_visted
  parser.unique_views
end

parse_file
