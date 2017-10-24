class Card < ApplicationRecord
  belongs_to :wallet

  validates :number, presence: true, numericality: { only_integer: true }
  validates :due_date, presence: true
  validates :exp_date, presence: true
  validates :cvv, presence: true, length: { is: 3 }
  validates :real_limit, presence: true
  validates :spent_value, presence: true
  validates :wallet, presence: true

  before_validation :update_float_limit

  def truncate_number
    number.gsub(/\A[\d]{12}/, '*' * 12)
  end

  private

  def update_float_limit
    self.float_limit = real_limit - spent_value
  end
end
