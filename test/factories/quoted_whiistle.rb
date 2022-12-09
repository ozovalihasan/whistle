FactoryBot.define do
  factory :quoted_whiistle do
    body { Faker::Quote.famous_last_words }
    user_id { User.ids.sample }
    whiistle_id { Whiistle.ids.sample }
  end
end

FactoryBot.define do
  factory :mock_quoted_whiistle, class: "QuotedWhiistle" do
    sequence(:body) { |n| "mock_body_#{n}" }
    sequence(:user_id) { |n| n }
    sequence(:whiistle_id) { |n| n }
  end
end

