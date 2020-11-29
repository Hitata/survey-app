FactoryBot.define do
  factory :publisher do
    sequence(:name) { |n| "name_#{n}" }
    sequence(:uid) { |n| "#{n}" }
    sequence(:email) { |n| "email_#{n}@example.com" }
    password { '12345678' }
  end
end
