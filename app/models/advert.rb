class Advert < ApplicationRecord
  include AASM
  aasm do
    state :publicated, initial: true
    state :sold

    event :sell do
      transitions from: :publicated, to: :sold
    end
  end

  has_many :requests

  belongs_to :user
  belongs_to :category

  validates_length_of :article, :is => 5
  validates :title, presence: true

end
