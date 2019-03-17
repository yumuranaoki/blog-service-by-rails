FactoryBot.define do
  factory :user do
    name "kneegorilla"
    sequence(:email) { |n| "kneegorilla#{n}@example.com" } 
    password "password"
    password_confirmation "password"
  end
end
