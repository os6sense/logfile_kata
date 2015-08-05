require_relative '../../lib/parser.rb'
require 'capybara/rspec'

feature '#most_visted' do
  let(:filename) { File.dirname(__FILE__) + '/test_data/webserver.log' }

  let(:expected) do
    "/about/2                       90 visits\n" \
    "/contact                       89 visits\n" \
    "/index                         82 visits\n" \
    "/about                         81 visits\n" \
    "/help_page/1                   80 visits\n" \
    "/home                          78 visits\n"
  end

  scenario 'when the test logfile is supplied' do
    parser = Parser.new(filename)
    expect { parser.most_visted }.to output(expected).to_stdout
  end
end
