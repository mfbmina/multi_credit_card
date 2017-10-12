class Card < ApplicationRecord
  belongs_to :wallet

  validates :number, presence: true, numericality: { only_integer: true }
  validates :due_date, presence: true
  validates :exp_date, presence: true
  validates :cvv, presence: true, length: { is: 3 }
  validates :limit, presence: true
  validates :spent_value, presence: true
  validates :wallet, presence: true
end
