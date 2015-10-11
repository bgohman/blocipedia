FactoryGirl.define do
  factory :collaboration do
    association :wiki, factory: :wiki
    association :user, factory: :user
  end
end