FactoryBot.define do
  factory :rewhiistle do
    user_id { User.ids.sample }
    whiistle_id { BaseWhiistle.ids.sample }
  end
end

FactoryBot.define do
  factory :mock_rewhiistle, class: "Rewhiistle" do
    sequence(:user_id) { |n| n }
    sequence(:whiistle_id) { |n| n }
  end
end

