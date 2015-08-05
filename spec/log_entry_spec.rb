require_relative '../lib/log_entry.rb'

describe LogEntry do
  let(:url) { '/home' }
  let(:ip) { '999.999.999.999' }

  subject { described_class.new(url, ip) }

  describe '#initialize' do
    it 'sets the #url' do
      expect(subject.url).to eq url
    end

    it 'sets the #ip' do
      expect(subject.ip).to eq ip
    end
  end

  describe '.parse' do
    let(:line) { '/home 999.999.999.999' }

    it 'is expected to yield a log entry' do
      expect { |b| described_class.parse(line, &b) }.to yield_with_args(LogEntry)
    end
  end
end
