FactoryGirl.define do
  factory :backlog do
    ignore do
      story_count 5
      compleated_story_count 2
    end

    after(:create) do |backlog, evaluator|
      create_list(:story, evaluator.story_count, backlog: backlog)
      create_list(:compleated_story, evaluator.compleated_story_count, backlog: backlog)

    end
  end
end
