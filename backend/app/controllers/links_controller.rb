class LinksController < ApplicationController
  def index
    # I understand this is an issue if there's hundreds of links. Good enough for a demo?
    # I also know I could implement a counter cache for number of links. The below is for expediency
    links = Link.find_each.map do |link|
      {
        id: link.id,
        original: link.original,
        short: link.short,
        click_count: link.clicks.count
      }
    end

    render json: links
  end

  def show
    link = Link.find(params[:id])
    details = link.clicks.find_each.map do |click|
      {
        id: click.id,
        original: link.original,
        device: click.device,
        ua: click.ua,
        created_at: click.created_at
      }
    end

    render json: details
  end
end
