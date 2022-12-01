FactoryBot.define do
  factory :whiistle do
    body { Faker::Quote.famous_last_words }
  end
end

FactoryBot.define do
  factory :mock_whiistle, class: "Whiistle" do
    sequence(:body) { |n| "mock_body_#{n}" }
  end
end
