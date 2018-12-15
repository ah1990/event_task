FactoryBot.define do
  factory :user do
    name SecureRandom.uuid
    surname SecureRandom.uuid
    sequence(:email) { |n| "email#{n}@gmail.com" }
    password "1234"
    password_confirmation "1234"
  end
end
