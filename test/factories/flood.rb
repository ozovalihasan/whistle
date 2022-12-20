FactoryBot.define do
  factory :flood do
    body { Faker::Quote.famous_last_words }
    user_id { User.ids.sample }
    base_whiistle_id { Whiistle.ids.sample }
  end
end

FactoryBot.define do
  factory :mock_flood, class: "Flood" do
    sequence(:body) { |n| "mock_body_#{n}" }
    sequence(:user_id) { |n| n }
    sequence(:base_whiistle_id) { |n| n }
  end
end

