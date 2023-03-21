# frozen_string_literal: true

FactoryBot.define do
  factory :reply do
    body { Faker::Quote.famous_last_words }
    user_id { User.ids.sample }
    base_whiistle_id { Whiistle.ids.sample }
  end
end

FactoryBot.define do
  factory :quoting_reply, class: 'Reply' do
    body { Faker::Quote.famous_last_words }
    user_id { User.ids.sample }
    base_whiistle_id { Whiistle.ids.sample }
    quoted_whiistle_id { BaseWhiistle.ids.sample }
  end
end

FactoryBot.define do
  factory :mock_reply, class: 'Reply' do
    id { (BaseWhiistle.last&.id || 0) + 1 }
    sequence(:body) { |n| "mock_body_reply_#{n}" }
    sequence(:user_id) { |n| User.first.id + n - 1 }
    sequence(:base_whiistle_id) { |n| BaseWhiistle.first.id + n - 1 }
  end
end
