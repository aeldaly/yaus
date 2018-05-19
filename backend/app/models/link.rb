class Link < ApplicationRecord
  has_many :clicks

  validates :original, :short, presence: true
  validates :short, uniqueness: true

  class << self
    def create_uniq(original)
      bloom_filter = Short::BloomFilter.instance

      unless bloom_filter.include?(original)
        latest_short = Link.lock.last.try(:short) || "a"
        newest = latest_short.succ

        bloom_filter.insert(original)
        

        create(original: original, short: newest)
      else
        Link.find_by(original: original)
      end
    end
  end
end
