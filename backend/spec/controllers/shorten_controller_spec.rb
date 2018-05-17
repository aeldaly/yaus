require 'rails_helper'

RSpec.describe ShortenController, type: :controller do
  let(:original) { 'https://google.ca' }
  let(:body) { JSON.parse(response.body) }

  describe "POST (create)" do
    context 'when url has not been shortened before' do
      before { Short::UrlShortener.stub_chain(:new, :shorten).and_return('abcd') }

      it '' do
        expect{ post :create, params: { url: original } }.to change{ Link.count }.by(1)
        expect(body['short']).to eql('abcd')
      end
    end

    context 'when url has been shortened before' do
      before do
        Short::UrlShortener.stub_chain(:new, :shorten).and_return(nil)
        allow(Link).to receive(:find_by).and_return(Link.new(short: 'abcd'))
      end

      it '' do
        post :create, params: { url: original }
        expect(body['short']).to eql('abcd')
      end
    end
  end
end
