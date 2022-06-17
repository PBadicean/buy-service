FactoryBot.define do
  factory :advert do
    sequence(:article) { |n| "#{n}23gh" }
    title  { 'NEW model advert' }
  end
end
