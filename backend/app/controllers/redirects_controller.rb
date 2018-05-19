class RedirectsController < ApplicationController
  def create
    link = Link.find_by(short: code)

    link.clicks.create!(ip: ip, device: device, ua: ua)

    render json: link.original
  end

  private

  def code
    params.require(:code)
  end

  def ip
    params.require(:ip)
  end

  def device
    params.require(:device)
  end

  def ua
    params.permit(:ua)
  end
end
