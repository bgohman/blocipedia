FactoryGirl.define do
  factory :user do
    name "test user"
    sequence(:email, 100) { |n| "test#{n}@example.com" }
    password "helloworld"
    password_confirmation "helloworld"
    confirmed_at Time.now
  end
end