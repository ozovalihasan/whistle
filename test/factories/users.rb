# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    username { Faker::Internet.username }
    fullname { Faker::Name.name }
    email { Faker::Internet.email }
    password { 'aaaaaa' }
    profile_picture { Rack::Test::UploadedFile.new("app/assets/images/avatar-#{rand(1..3)}.jpg", 'image/png') }
    cover_image { Rack::Test::UploadedFile.new("app/assets/images/cover-image-#{rand(1..3)}.jpg", 'image/png') }
  end
end

FactoryBot.define do
  factory :user_with_index, class: "User" do
    username { Faker::Internet.username }
    fullname { Faker::Name.name }
    email { Faker::Internet.email }
    password { 'aaaaaa' }
    sequence(:profile_picture) {|index| Rack::Test::UploadedFile.new("app/assets/images/avatar#{ index }.jpg", 'image/png') }
    sequence(:cover_image) {|index| Rack::Test::UploadedFile.new("app/assets/images/cover-image#{ index }.jpg", 'image/png') }
  end
end

FactoryBot.define do
  factory :mock_user, class: 'User' do
    sequence(:id) { |n| n }
    sequence(:username) { |n| "mock_username_#{n}" }
    sequence(:fullname) { |n| "mock_fullname_#{n}" }
    sequence(:email) { |n| "mock_user_#{n}@email.com" }
    sequence(:password) { |_n| 'aaaaaa' }
  end
end
