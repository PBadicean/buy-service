FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "pserson#{n}@example.com" }
    name  { 'Dima' }
    admin { false }
    password { 'dima123' }
    password_confirmation { 'dima123' }

  end
end
