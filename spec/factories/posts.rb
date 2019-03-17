FactoryBot.define do
  factory :post do
    sequence(:title) { |n| "title#{n}" }
    place "myplace"
    detail "mytext"
  end
end
