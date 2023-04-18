# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)



unless User.find_by(username: "guest")
  FactoryBot.create(
    :user, 
    username: "guest", 
    fullname: "Guest", 
    email: "guest@email.com",
    cover_image: Rack::Test::UploadedFile.new("app/assets/images/cover-image-guest.jpg", 'image/png'),
    profile_picture: Rack::Test::UploadedFile.new("app/assets/images/avatar-guest.jpg", 'image/png') 
  )
end

case Rails.env
when "development"

  10.times do
    FactoryBot.create(:user)
  rescue ActiveRecord::RecordInvalid
  end
  
when "production"
  
  10.times do
    FactoryBot.create(:user_with_index)
  rescue ActiveRecord::RecordInvalid
  end

end

FactoryBot.create_list(:whiistle, 100)
FactoryBot.create_list(:quoting_whiistle, 30)
FactoryBot.create_list(:reply, 100)
FactoryBot.create_list(:quoting_reply, 30)

100.times do
  FactoryBot.create(:like)
rescue ActiveRecord::RecordInvalid
end

100.times do
  FactoryBot.create(:rewhiistle)
rescue ActiveRecord::RecordInvalid
end

FactoryBot.create_list(:flood, 100)
FactoryBot.create_list(:quoting_flood, 30) 

30.times do
  FactoryBot.create(:relation)
rescue ActiveRecord::RecordInvalid
end
