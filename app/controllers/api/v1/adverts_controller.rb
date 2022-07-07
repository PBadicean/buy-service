class Api::V1::AdvertsController < ApplicationController
  def index
   @adverts =  Advert.all
   render json: @adverts
  end

  def show
    advert = Advert.find_by(id: params[:id])
    if advert
      render json: advert
    else
      head 404
    end
  end

  def create
    advert = Advert.new(advert_params)
    advert.save!
  end

  def update
    advert = Advert.find(params[:id])
    advert.update(advert_params)
  end

  private

  def advert_params
    params.require(:advert).permit(:title, :article, :user_id)
  end
end
