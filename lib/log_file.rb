require 'forwardable'
# Container representation for a logfile
class LogFile
  extend Forwardable

  def_delegators :@urls, :[], :size

  def initialize
    @urls = Hash.new { |h, k| h[k] = [] }
  end

  def add(entry)
    @urls[entry.url] << entry
  end

  def sort_by(&block)
    @urls.sort_by(&block).reverse
  end
end
