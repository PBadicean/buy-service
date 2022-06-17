require 'rails_helper'
require 'simplecov'
SimpleCov.start 'rails'

RSpec.describe User, type: :model do

  describe 'associations' do
    it { should have_many(:adverts).class_name('Advert') }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  describe "#client?" do
    context "user a client" do
      let(:user) { create :user }
      it "returns true" do
        expect(user.admin?).to eq false
      end
    end

    context "user is not client" do
      let(:user) { create :user, admin: true}
      it "returns false" do
        expect(user.admin?).to eq true
      end
    end
  end

end
