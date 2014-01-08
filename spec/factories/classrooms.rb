# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :classroom do
    name "Biology"
    description "6th grade 2013-2014"
    association :user, factory: :teacher
  end
end
