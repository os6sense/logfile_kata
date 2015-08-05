
INSTALLATION

Clone this repository and run 'bundle install'

RUNNING

Tests can be run via 'rake' or 'rspec'

The application can be run from the command line via

'ruby parser_ui.rb <path to logfile>'

e.g ruby parser_ui.rb spec/features/test_data/webserver.log

NOTES

The basic answer to this kata can be expressed in just a few lines e.g:

    def process(filename)
      urls = Hash.new { |h, k| h[k] = [] }
      File.open(filename, 'r').each_line do | line |
        line.split(" ").tap { | url, ip | urls[url] << ip }
      end
      urls.sort_by { | k, v | v.count }.each { |k, v| puts "#{k} #{v.count} visits" }
      urls.sort_by { | k, v | v.uniq.count }.each { |k, v| puts "#{k} #{v.uniq.count} unique views" }
    end

    process(ARGV[0])

I note this because I believe my solution to be over-engineered but providing
a good example of a more OO solution to the problem.
