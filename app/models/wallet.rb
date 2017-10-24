class Wallet < ApplicationRecord
  belongs_to :user

  has_many :cards

  validates_presence_of :user

  def max_limit
    cards.sum(:float_limit)
  end
end
