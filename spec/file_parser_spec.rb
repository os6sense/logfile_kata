require_relative '../lib/file_parser.rb'

require 'memfs'

describe FileParser do
  let(:filename) { '/tmp/test.txt.tmp' }

  before do
    MemFs.activate!
  end
  after { MemFs.deactivate! }

  describe '.parse' do
    context 'when the file does not exist' do
      it 'fails' do
        expect { described_class.parse(filename) }.to raise_error(/not found/)
      end
    end

    context 'when the file exists' do
      before do
        File.open(filename, 'w') do |f|
          f.write('/home 999.999.999.999')
          f.write('/home1 111.111.111.111')
        end
      end

      it 'yields the entry' do
        pending "TODO: Fix problem with memfs and rspec"
        #expect { |b| described_class.parse(filename, &b) }.to yield_with_args()
      end
    end
  end
end
