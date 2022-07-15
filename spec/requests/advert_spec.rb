require "rails_helper"

RSpec.describe Advert, :type => :request do
  let(:user)          { create(:user) }
  let(:category)      { create(:category) }
  let(:advert)        { create(:advert, user: user) }
  let(:second_advert) { create(:advert, user: user) }
  let(:result)        { JSON.parse(response.body) }

  let(:create_request) do
    post "/api/v1/adverts", params: params
  end

  let(:update_request) do
    put "/api/v1/adverts/#{advert.id}",
    params: {
      "advert" => {
        "id" => advert.id,
        "title" => "NEW advert23"
      }
    }
  end

  let(:params) {
    {
      "advert" => {
      "user_id" => user.id,
      "title" => 'NEW advert',
      "article" => '12cod',
      "category_id" => category.id
      }
    }
  }

  describe "POST #create" do
    it 'add new instance in db' do
      expect { create_request }.to(change { Advert.count }.to(1))
    end
  end

  describe "PUT #update" do
    it 'update the advert' do
      expect { update_request }
      .to change { advert.reload.title }
      .from("NEW model advert")
      .to("NEW advert23")
    end
  end

  describe "GET #index" do
    before do
      advert
      second_advert
      get "/api/v1/adverts"
    end
    it "returns http success" do
      expect(response.status).to eq(200)
    end

    it 'only returns adverts' do
      result_ids = result.map { |res| res['id'] }

      expect(result_ids).to include advert.id
      expect(result_ids).to include second_advert.id
    end
  end

  describe "GET #show" do
    before do
      get "/api/v1/adverts/#{advert.id}"
    end

    it 'returns http success' do
      expect(response.status).to eq(200)
    end

    it 'render json advert' do
      expect { hash_body = JSON.parse(response.body)
            .with_indifferent_access }
            .not_to raise_exception
    end
  end
end
