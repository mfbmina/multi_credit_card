json.id @user.id
json.email @user.email
json.first_name @user.first_name
json.last_name @user.last_name
json.full_name @user.full_name
json.token @user.authentication_token
json.wallet do
  json.limit @user.wallet.limit
  json.max_limit @user.wallet.max_limit
  json.cards @user.wallet.cards do |card|
    json.id card.id
    json.truncate_number card.truncate_number
    json.exp_date card.exp_date
    json.url card_url(card)
  end
end
