FactoryBot.define do
  selected_followind_id = User.ids.sample
  
  factory :relation do
    following_id { selected_followind_id }
    followed_id { (User.ids - [selected_followind_id]).sample }
  end
end

FactoryBot.define do
  factory :mock_relation, class: "Relation" do
    sequence(:following_id) { |n| n }
    sequence(:followed_id) { |n| n + 1 }
  end
end
