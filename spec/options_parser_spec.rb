require_relative '../lib/options_parser.rb'

describe OptionsParser do
  subject { described_class }

  describe '.parse' do
    context 'when provided with empty args' do
      let(:args) { [] }

      it 'exits' do
        expect { subject.parse(args) }.to raise_error SystemExit
      end
    end

    context 'when provided with more than one arg' do
      let(:args) { ['filename.txt', 'something'] }

      it 'exits' do
        expect { subject.parse(args) }.to raise_error SystemExit
      end
    end
  end
end
