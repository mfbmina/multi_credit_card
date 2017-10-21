module PayInvoice
  def self.call(card, value)
    return false if value.to_f > card.spent_value
    card.update_attribute(:spent_value, card.spent_value - value.to_f)
  end
end
