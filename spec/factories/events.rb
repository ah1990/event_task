FactoryBot.define do
  factory :event do
    name 'Test'
    start_at DateTime.now
    end_at DateTime.now
    city

  end
end
