# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :assignment do
    classroom_id 1
    video_link "MyString"
    title "MyString"
    description "MyText"
    status "MyString"
  end
end
