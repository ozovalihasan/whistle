# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'

User.create([{ username: 'hasan', fullname: 'Hasan Ozovali', email: 'hillary@gmail.com', password: 'aaaaaa', password_confirmation: 'aaaaaa' },
             { username: 'anonymous', fullname: 'Anonymous', email: 'hasan@gmail.com', password: 'aaaaaa', password_confirmation: 'aaaaaa' },
             { username: 'john', fullname: 'John Jones', email: 'john@gmail.com', password: 'aaaaaa', password_confirmation: 'aaaaaa' },
             { username: 'mary', fullname: 'Mary Smith', email: 'mary@gmail.com', password: 'aaaaaa', password_confirmation: 'aaaaaa' }])

User.first.whiistles.create(body: 'Etciam ut eleifend nisl. Orci varius natoque penkiatibus et magnis dis parturient montes, nascetur ridiculus mus.')
User.second.whiistles.create(body: 'Aliquam consectetur felis a accumsan dignissim. Phasellus sed luctus orci, ut laoreet mi. Sed eu dui gravida, porta massa in, mattis tellus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quam massa, eleifend eget finibus sed, aliquet sed sem. Mauris vitae est metus. Sed velit orci, ullamcorper suscipit feugiat egestas, sollicitudin egestas ex. Nunc accumsan non magna sed egestas. Aenean vel lacinia mi. ')
User.first.whiistles.create(body: ' Cras tempus est et fringilla porta. Etiam quis ornare nunc. Etiam purus sapien, venenatis nec laoreet a, maximus quis libero.')
User.first.following_relations.create(followed_id: User.second.id)

User.all[2..-1].each do |user|
  rand(1...User.all.size).times do
    user.following_relations.create(followed_id: rand(1...User.all.size))
    User.find(rand(1...User.all.size)).following_relations.create(followed_id: user.id)
  end
end

30.times do
  user = User.find(rand(1..User.all.size))
  rand(1..2).times do
    user.whiistles.create(body: Faker::Lorem.paragraph(sentence_count: 2))
  end
end

User.all.find_each do |user|
  counter = user.id
  avatar = open("#{Rails.root}/app/assets/images/avatar#{counter}.jpg")
  user.profile_picture.attach(io: avatar, filename: "avatar#{counter}.jpg")
  cover = open("#{Rails.root}/app/assets/images/#{counter}.jpg")
  user.cover_image.attach(io: cover, filename: "cover#{counter}.jpg")
end
