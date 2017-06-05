FactoryGirl.define do
  factory :tweet do
    association :user, factory: :user
    body 'this is my tweet'
    reply_ud 1

    trait :invalid do
      body nil
    end
  end
end
