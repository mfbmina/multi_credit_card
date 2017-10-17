FactoryGirl.define do
  factory :user do
    first_name "John"
    last_name  "Doe"
    sequence :email do |n|
      "person#{n}@example.com"
    end
  end

  factory :wallet do
    limit 100
    user
  end

  factory :card do
    number "4111111111111111"
    due_date "2017-10-30"
    exp_date "2022-10-01"
    cvv "123"
    limit 1000
    wallet
  end
end
