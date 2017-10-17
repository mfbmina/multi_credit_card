module AddCard
  def self.call(user, card_params)
    card = user.wallet.cards.build(card_params)
    card.save
    card
  end
end
