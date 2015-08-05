require_relative 'lib/options_parser'
require_relative 'lib/parser'

def parse_file
  filename = OptionsParser.parse(ARGV)[:filename]
  parser = Parser.new(filename)

  parser.most_visted
  parser.unique_views
end

parse_file
