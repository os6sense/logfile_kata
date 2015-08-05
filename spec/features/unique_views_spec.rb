require_relative '../../lib/parser.rb'
require 'capybara/rspec'

feature '#unique_views' do
  let(:filename) { File.dirname(__FILE__) + '/test_data/webserver.log' }

  let(:expected) do
    "/index                         23 unique views\n" \
    "/home                          23 unique views\n" \
    "/contact                       23 unique views\n" \
    "/help_page/1                   23 unique views\n" \
    "/about/2                       22 unique views\n" \
    "/about                         21 unique views\n"
  end

  scenario 'when the test logfile is supplied' do
    parser = Parser.new(filename)
    expect { parser.unique_views }.to output(expected).to_stdout
  end
end
