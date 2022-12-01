FactoryBot.define do
  factory :relation do
    following_id { User.ids.sample }
    followed_id { User.ids.sample }
  end
end

FactoryBot.define do
  factory :mock_relation, class: "Relation" do
    sequence(:following_id) { |n| n }
    sequence(:followed_id) { |n| n + 1 }
  end
end
