require 'rails_helper'

RSpec.describe Request, type: :model do

  describe 'associations' do
    it { should belong_to(:user).class_name('User') }
    it { should belong_to(:advert).class_name('Advert') }
    it { should belong_to(:category).class_name('Category') }
  end

end
