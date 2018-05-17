class ShortenController < ApplicationController
  def create
    short = Short::UrlShortener.new.shorten(url)
    
    if short
      Link.create(original: url, short: short)
    else
     short = Link.find_by(original: url).try(:short)
    end

    render json: { short: short }
  end

  private

  def url
    params.require(:url)
  end
end
