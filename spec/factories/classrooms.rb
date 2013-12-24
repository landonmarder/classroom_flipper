# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :classroom do
    name "MyString"
    description "MyText"
    user_id 1
  end
end
