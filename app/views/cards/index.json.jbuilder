json.array! @cards do |card|
  json.id card.id
  json.truncate_number card.truncate_number
  json.real_limit card.real_limit
  json.spent_value card.spent_value
  json.due_date card.due_date
  json.exp_date card.exp_date
end
