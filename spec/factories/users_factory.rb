FactoryGirl.define do

  factory :user do
    sequence(:username) { |n| "devbootcamp#{n}" }
    sequence(:email) { |n| "testing#{n}@gmail.com" }
    password "testing123"
  end
end
