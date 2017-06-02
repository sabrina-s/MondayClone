FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "user#{n}" }
    sequence(:email) { |n| "email#{n}@example.com" }
    password "123123"
  end

  # trait :invalid do
  #   username nil
  #   email nil
  #   password nil
  # end
end