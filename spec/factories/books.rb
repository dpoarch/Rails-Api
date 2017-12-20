FactoryGirl.define do
  factory :book do
    title { Faker::Book.title }
    author { Faker::Book.author }
    pages { Faker::Number.number(3) }
  end
end