FactoryBot.define do
  factory :survey do
    sequence(:title) { |n| "title_#{n}" }
    active { false }

    factory :active_survey do
      active { true }
    end
  end
end
