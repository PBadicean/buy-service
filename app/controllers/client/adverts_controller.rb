class Client::AdvertsController < Client::BaseController
  def index
    @adverts = current_user.adverts
  end

  def show
    @advert = Advert.find_by(id: params[:id])
  end
end
