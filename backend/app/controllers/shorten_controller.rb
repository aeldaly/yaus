class ShortenController < ApplicationController
  def create
    link = Link.create_uniq(url)

    render json: { short: link.short }
  end

  private

  def url
    params.require(:url)
  end
end
