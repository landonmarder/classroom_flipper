# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question do
    assignment
    prompt "Is this a question?"
  end
end
