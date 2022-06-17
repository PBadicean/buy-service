require 'rails_helper'

RSpec.describe Advert, type: :model do

  describe 'associations' do
    it { should have_many(:requests).class_name('Request') }
    it { should belong_to(:user).class_name('User') }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:article).is_equal_to(5) }
  end

  describe 'state transitions' do

    context "advert has states" do
      let(:author) { create(:user) }
      let(:advert) { create(:advert, user: author) }
      it "returns true" do
        expect(advert).to transition_from(:publicated).to(:sold).on_event(:sell)
      end
    end
  end
end
