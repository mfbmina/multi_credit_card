class Wallet < ApplicationRecord
  belongs_to :user

  validates_presence_of :user

  def maximum_limit
    0
  end
end
