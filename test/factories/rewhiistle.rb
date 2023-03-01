FactoryBot.define do
  factory :rewhiistle do
    user_id { User.ids.sample }
    whiistle_id { BaseWhiistle.ids.sample }
  end
end

FactoryBot.define do
  factory :mock_rewhiistle, class: "Rewhiistle" do
    sequence(:id) { |n| n }
    sequence(:user_id) { |n| User.first.id + n - 1 }
    sequence(:whiistle_id) { |n| BaseWhiistle.first.id + n - 1 }
  end
end

