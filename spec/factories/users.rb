# # Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :student, :class => 'User' do
    first_name 'StudentFirst'
    last_name 'StudentLast'
    sequence(:email) { |n| "student#{n}@example.com" }
    password 'Password123'
    role 'Student'
  end
end

FactoryGirl.define do
  factory :teacher, :class => 'User' do
    first_name 'TeacherFirst'
    last_name 'TeacherLast'
    sequence(:email) { |n| "teacher#{n}@example.com" }
    password 'Password123'
    role 'Teacher'
  end
end
