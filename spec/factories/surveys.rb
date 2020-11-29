FactoryBot.define do
  factory :survey do
    sequence(:title) { |n| "title_#{n}" }

    trait :with_questions do
      after(:create) do |p, evaluator|
        create(
          :question,
          title: evaluator.title,
          options: evaluator.options,
        )
      end
    end

    factory :with_questions, traits: %i[with_questions]
  end
end
