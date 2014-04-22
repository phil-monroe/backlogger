FactoryGirl.define do
  factory :story do
    sequence(:title) { |n| "Story #{n}"}
    story_points {   rand(100) }
    business_value { rand(100) * 1000 }

    factory :compleated_story do
      compleated_at { Time.now }
      started_at    { 1.day.ago }
    end
  end
end
