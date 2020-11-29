FactoryBot.define do
  factory :question do
    sequence(:title) { |n| "title_#{n}" }
    options { ['question 1', 'question 2'] }
  end
end
