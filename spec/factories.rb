FactoryBot.define do
  factory :user do
    email { 'dima@mail.ru' }
    name  { 'Dima' }
    admin { false }
    password { 'dima123' }
    password_confirmation { 'dima123' }
  end
end
