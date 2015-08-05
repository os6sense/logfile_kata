require_relative '../lib/log_file.rb'

describe LogFile do
  subject { LogFile.new }
  let(:entry) { double('LogEntry', url: '/home', ip: '999.999.999.999') }

  describe '#add' do
    before { subject.add(entry) }

    it 'adds a new entry to the log' do
      expect(subject[entry.url]).to eq [entry]
    end

    context 'when the same ip is added more than once' do
      before { subject.add(entry) }
      it 'it is added to existing entries array' do
        expect(subject[entry.url]).to eq [entry, entry]
      end
    end
  end

  describe '#[]' do
    before { 2.times { subject.add(entry) } }
    it 'returns the array of entries accessed by the ip' do
      expect(subject[entry.url]).to eq [entry, entry]
    end
  end

  describe '#sort_by' do
    let(:a) { double('LogEntry', url: 'a', ip: '1') }
    let(:b) { double('LogEntry', url: 'b', ip: '2') }
    let(:c) { double('LogEntry', url: 'c', ip: '3') }

    before do
      subject.add(b)
      subject.add(c)
      subject.add(a)
    end

    it 'returns an array of key entry pairs sorted by #block descending' do
      expect(subject.sort_by { |k, _| k })
        .to eq [['c', [c]], ['b', [b]], ['a', [a]]]
    end
  end
end
