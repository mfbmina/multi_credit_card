json.array! @users do |user|
  json.id user.id
  json.email user.email
  json.first_name user.first_name
  json.last_name user.last_name
  json.full_name user.full_name
  json.url user_url(user)
end
