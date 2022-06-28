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

  let(:advert) { create(:advert, user: user) }
  let(:request) do
    put "/api/v1/adverts/#{advert.id}", params: {
      "advert" => {
        "id" => advert.id,
        "title" => "NEW advert23"
        }
      }
  end

  it 'update the advert' do
    expect { request }
    .to change { advert.reload.title }
    .from("NEW model advert")
    .to("NEW advert23")
  end

end

