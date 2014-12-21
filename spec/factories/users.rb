FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "example-#{n}@lvh.me" }
    password "password"

    factory :admin_user do
      admin true
    end
  end
end
