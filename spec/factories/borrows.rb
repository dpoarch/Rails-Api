FactoryGirl.define do
  factory :item do
    name { Faker::Name.name_with_middle }
    returned false
    todo_id nil
  end
end