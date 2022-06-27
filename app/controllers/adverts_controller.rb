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

  def create
    advert = Advert.new(advert_params)
    advert.save!
  end

  private

  def advert_params
    params.require(:advert).permit(:title, :article, :user_id)
  end
end
