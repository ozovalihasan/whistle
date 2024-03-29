# frozen_string_literal: true

FactoryBot.define do
  factory :like do
    user_id { User.ids.sample }
    whiistle_id { Whiistle.ids.sample }
  end
end

FactoryBot.define do
  factory :mock_like, class: 'Like' do
    sequence(:id) { |n| n }
    sequence(:user_id) { |n| User.first.id + n - 1 }
    sequence(:whiistle_id) { |n| BaseWhiistle.first.id + n - 1 }
  end
end
