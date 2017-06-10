FactoryGirl.define do
  factory :like do
    association :user, factory: :user
    association :tweet, factory: :tweet
  end
end