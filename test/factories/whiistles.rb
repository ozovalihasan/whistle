FactoryBot.define do
  factory :whiistle do
    body { Faker::Quote.famous_last_words }
    user_id { User.ids.sample }
  end
end

FactoryBot.define do
  factory :quoting_whiistle, class: "Whiistle" do
    body { Faker::Quote.famous_last_words }
    user_id { User.ids.sample }
    quoted_whiistle_id { BaseWhiistle.ids.sample }
  end
end

FactoryBot.define do
  factory :mock_whiistle, class: "Whiistle" do
    sequence(:body) { |n| "mock_body_whiistle_#{n}" }
    sequence(:user_id) { |n| n }
  end
end

