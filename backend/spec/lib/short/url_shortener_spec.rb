require 'rails_helper'

RSpec.describe Short::UrlShortener, type: :model do
  let(:bloom_filter) { subject.instance_variable_get('@bloom_filter') }
  let(:url) { 'https://google.ca' }
  let(:short_url) { 123456 }

  let(:now) { 5.seconds.ago.to_f }
  let(:later) { 5.seconds.from_now.to_f }

  describe '#shorten' do
    context 'is efficient' do
      before do 
        allow(bloom_filter).to receive(:include?).and_return(included?)
        allow(Time).to receive(:now).and_return(short_url)
      end

      after { subject.shorten(url) }

      context 'when url hasn\'t been shortened before' do
        let(:included?) { false }

        it { expect(bloom_filter).to receive(:insert).once.with(url) }
      end

      context 'when url has been shortened before' do
        let(:included?) { true }

        it { expect(bloom_filter).to_not receive(:insert) }
      end
    end

    context 'returns shortened url' do
      let(:url) { 'https://google.com' }
      
      subject { described_class.new.shorten(url) }

      context 'when url hasn\'t been shortened before' do
        it { expect(subject).to be_between(now, later) }
      end

      context 'when url has been shortened before' do
        before { subject }

        it { expect(subject).to be_nil }
      end
    end
  end
end
