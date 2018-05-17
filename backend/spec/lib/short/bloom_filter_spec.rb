require 'rails_helper'

RSpec.describe Short::BloomFilter, type: :model do
  subject { Short::BloomFilter.instance }

  context 'Inserting' do
    before { subject.insert('abcd') }

    it { expect(subject.include?('abcd')).to be true }
    it { expect(subject.include?('abcdef')).to be false }
  end

  context 'Seeding' do
    before { subject.seed(%w(a b)) }

    it { expect(subject.include?('a')).to be true }
    it { expect(subject.include?('b')).to be true }
    it { expect(subject.include?('c')).to be false }
  end
end
