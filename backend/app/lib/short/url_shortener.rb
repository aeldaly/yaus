module Short
  class UrlShortener
    def initialize
      @bloom_filter = Short::BloomFilter.instance
    end

    def shorten(url)
      unless @bloom_filter.include?(url)
        short = Time.now.to_f
        @bloom_filter.insert(url)

        return short
      end
    end
  end
end