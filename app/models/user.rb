class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :name,
    presence: true,
    length: {maximum: 50},
    on: :create

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :adverts

  def client?
    !admin?
  end
end
