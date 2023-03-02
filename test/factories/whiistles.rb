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
    id { (BaseWhiistle.last&.id || 0)  + 1 }
    sequence(:body) { |n| "mock_body_whiistle_#{n}" }
    sequence(:user_id) { |n| User.first.id + n - 1 }
  end
end

FactoryBot.define do
  factory :mock_quoting_whiistle, class: "Whiistle" do
    id { (BaseWhiistle.last&.id || 0)  + 1 }
    sequence(:body) { |n| "mock_body_whiistle_#{n}" }
    sequence(:user_id) { |n| User.first.id + n - 1 }
    sequence(:quoted_whiistle_id) { |n| BaseWhiistle.first.id + n - 1 }
  end
end