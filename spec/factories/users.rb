# # Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :student, :class => 'User' do
    first_name 'Kobe'
    last_name 'Bryant'
    sequence(:email) { |n| "student#{n}@example.com" }
    password 'Password123'
    password_confirmation 'Password123'
    role 'Student'
    salutation 'Mr.'
  end
end

FactoryGirl.define do
  factory :teacher, :class => 'User' do
    first_name 'Michael'
    last_name 'Jordan'
    sequence(:email) { |n| "teacher#{n}@example.com" }
    password 'Password123'
    password_confirmation 'Password123'
    role 'Teacher'
    salutation 'Mr.'
  end
end
