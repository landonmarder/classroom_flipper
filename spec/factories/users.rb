# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name 'Michael'
    last_name 'Jordan'
    sequence(:email) { |n| "mj#{n}@example.com" }
    password 'Password123'
  end

  trait :teacher_role do
    role 'Teacher'
  end

  trait :student_role do
    role 'Student'
  end

  factory :teacher, traits: [:teacher_role]
  factory :student, traits: [:student_role]
end
