class Client::AdvertsController < Client::BaseController
  def index
    @adverts = current_user.adverts
  end

end
