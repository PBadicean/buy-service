require "rails_helper"

RSpec.describe Advert, :type => :request do
  let(:user) { create(:user) }
  let(:params) {
    {
      "advert" => {
        "user_id" => user.id,
        "title" => 'NEW advert',
        "article" => '12cod'
      }
    }
  }

  let(:request) do
    post "/api/v1/adverts", params: params
  end

  it 'creates the advert' do
    expect { request }.to(change { Advert.count }.to(1))
  end

end
