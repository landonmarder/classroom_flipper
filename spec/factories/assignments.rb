# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :assignment do
    video_link "http://www.youtube.com/watch?v=GEwEsdKrNcM"
    title "Playing Sick"
    description "Watch this video and then answer the questions below"
    status "Live"
    classroom
  end
end
