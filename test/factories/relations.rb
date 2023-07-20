# frozen_string_literal: true

FactoryBot.define do
  selected_followind_id = nil

  factory :relation do
    following_id { selected_followind_id = User.ids.sample }
    followed_id { (User.ids - [selected_followind_id]).sample }
  end
end

FactoryBot.define do
  factory :mock_relation, class: 'Relation' do
    sequence(:id) { |n| n }
    sequence(:following_id) { |n| User.first.id + n - 1 }
    sequence(:followed_id) { |n| User.first.id + n }
  end
end
