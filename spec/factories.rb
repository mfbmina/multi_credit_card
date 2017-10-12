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
end
