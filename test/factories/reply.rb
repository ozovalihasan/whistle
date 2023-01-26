FactoryBot.define do
  factory :reply do
    body { Faker::Quote.famous_last_words }
    user_id { User.ids.sample }
    base_whiistle_id { Whiistle.ids.sample }
  end
end

FactoryBot.define do
  factory :quoting_reply, class: "Reply" do
    body { Faker::Quote.famous_last_words }
    user_id { User.ids.sample }
    base_whiistle_id { Whiistle.ids.sample }
    quoted_whiistle_id { BaseWhiistle.ids.sample }
  end
end

FactoryBot.define do
  factory :mock_reply, class: "Reply" do
    sequence(:body) { |n| "mock_body_reply_#{n}" }
    sequence(:user_id) { |n| n }
    sequence(:base_whiistle_id) { |n| n }
  end
end

