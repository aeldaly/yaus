require 'singleton'

module Short
  class BloomFilter
    include Singleton

    delegate :insert, :include?, to: '@bloom_filter'

    def initialize
      @bloom_filter = ::BloomFilter.new
    end

    def seed(array)
      array.each {|element| @bloom_filter.insert(element) }
    end
  end
end