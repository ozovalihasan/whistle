FactoryBot.define do
  selected_parent_id = nil
  factory :flood do
    body { Faker::Quote.famous_last_words }
    base_whiistle_id { selected_parent_id = suitable_parent_of_flood }
    user_id { BaseWhiistle.find(selected_parent_id).user.id }
  end
end

def suitable_parent_of_flood
  loop do
    parent_id = (Whiistle.ids + Flood.ids).sample
    return parent_id if BaseWhiistle.find(parent_id).flood.nil?
  end
end

FactoryBot.define do
  selected_parent_id = nil
  factory :quoting_flood, class: "Flood" do
    body { Faker::Quote.famous_last_words }
    base_whiistle_id { selected_parent_id = suitable_parent_of_flood }
    user_id { BaseWhiistle.find(selected_parent_id).user.id }
    quoted_whiistle_id { BaseWhiistle.ids.sample }
  end
end

FactoryBot.define do
  factory :mock_flood, class: "Flood" do
    sequence(:body) { |n| "mock_body_flood_#{n}" }
    sequence(:user_id) { |n| n }
    sequence(:base_whiistle_id) { |n| n }
  end
end

FactoryBot.define do
  factory :mock_flood_of_same_user, class: "Flood" do
    sequence(:body) { |n| "mock_body_flood_#{n}" }
    user { User.first }
    sequence(:base_whiistle_id) { |n| n }
  end
end
