json.id @user.id
json.email @user.email
json.first_name @user.first_name
json.last_name @user.last_name
json.full_name @user.full_name
json.wallet do
  json.limit @user.wallet.limit
  json.max_limit @user.wallet.max_limit
end
