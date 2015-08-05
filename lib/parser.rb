require_relative 'log_file'
require_relative 'file_parser'

class Parser
  def initialize(filename, autorun = true)
    @logfile = LogFile.new
    @filename = filename

    parse if autorun
  end

  def parse
    FileParser.parse(@filename) { |entry| @logfile.add(entry) }
  end


  # Output a list of the pages with the most views, sorted in descending order
  # PARAMS
  # +logfile+:: - Optional. Use a different LogFile
  # +count:+::  - Optional, named parameter. Output at most count entries
  # +out:+::    - Optional, named parameter. Write output to IO +out+
  def most_visted(logfile = nil, count: nil, out: $stdout)
    (logfile || @logfile)
      .sort_by { |_, v| v.count }
      .take(count || @logfile.size)
      .each do |url, entries|
        format('visits', url, entries.count, out)
      end
  end

  # Output a list of the number pages with the highest number of unique views
  # sorted in descenting order.
  # PARAMS
  # +logfile+:: - Optional. Use a different LogFile
  # +count:+::  - Optional, named parameter. Output at most count entries
  # +out:+::    - Optional, named parameter. Write output to IO +out+
  def unique_views(logfile = nil, count: nil, out: $stdout)
    (logfile || @logfile)
      .sort_by { |_, v| v.uniq(&:ip).count }
      .take(count || @logfile.size)
      .each do |url, entries|
        format('unique views', url, entries.uniq(&:ip).count, out)
      end
  end

  private

  def format(tail, url, count, out)
    out.write sprintf("%-30s %d %s\n", url, count, tail)
  end
end
