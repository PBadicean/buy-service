class AdvertsController < ApplicationController
  def index
    render json: Advert.all
  end

  def show
    advert = Advert.find_by(id: params[:id])
    if advert
      render json: advert
    else
      head 404
    end
  end
end
