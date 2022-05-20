class Advert < ApplicationRecord
  belongs_to :user

  validates_length_of :article, :is => 5
  validates :title, presence: true

  has_many :requests

end
