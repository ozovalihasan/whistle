FactoryBot.define do
  selected_parent_id = nil
  factory :flood do
    body { Faker::Quote.famous_last_words }
    base_whiistle_id { selected_parent_id = (Whiistle.ids + Flood.ids).sample }
    user_id { BaseWhiistle.find(selected_parent_id).user.id }
  end
end

FactoryBot.define do
  factory :mock_flood, class: "Flood" do
    sequence(:body) { |n| "mock_body_#{n}" }
    sequence(:user_id) { |n| n }
    sequence(:base_whiistle_id) { |n| n }
  end
end

