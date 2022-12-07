FactoryBot.define do
  factory :user do
    username { Faker::Internet.username }
    fullname { Faker::Name.name }
    email { Faker::Internet.email }
    password { "aaaaaa" }
    profile_picture { Rack::Test::UploadedFile.new("app/assets/images/mock-#{rand(1..5)}.jpg", 'image/png') }
    cover_image { Rack::Test::UploadedFile.new("app/assets/images/mock-#{rand(1..5)}.jpg", 'image/png') }
  end
end

FactoryBot.define do
  factory :mock_user, class: "User" do
    sequence(:username) { |n| "mock_username_#{n}" }
    sequence(:fullname) { |n| "mock_fullname_#{n}" }
    sequence(:email) { |n| "mock_user_#{n}@email.com" }
    sequence(:password) { |n| "password_user_#{n}" }
  end
end

