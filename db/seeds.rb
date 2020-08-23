# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'

User.create([{ username: 'hillary', fullname: 'Hillary Kiptoo', email: 'hillary@hillary.hillary', password: 'aaaaaa', password_confirmation: 'aaaaaa' },
             { username: 'hasan', fullname: 'Hasan Ozovali', email: 'hasan@hasan.hasan', password: 'aaaaaa', password_confirmation: 'aaaaaa' }])

User.first.whiistles.create(body: 'Etiam ut eleifend nisl. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.')
User.second.whiistles.create(body: 'Aliquam consectetur felis a accumsan dignissim. Phasellus sed luctus orci, ut laoreet mi. Sed eu dui gravida, porta massa in, mattis tellus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quam massa, eleifend eget finibus sed, aliquet sed sem. Mauris vitae est metus. Sed velit orci, ullamcorper suscipit feugiat egestas, sollicitudin egestas ex. Nunc accumsan non magna sed egestas. Aenean vel lacinia mi. ')
User.first.whiistles.create(body: 'hi rasheed')
User.first.following_relations.create(followed_id: User.second.id)

5.times do
  user = User.create(
    username: Faker::Name.name.split(' ').join.downcase,
    fullname: Faker::Name.name,
    email: Faker::Internet.email,
    password: 'aaaaaa',
    password_confirmation: 'aaaaaa'
  )

  rand(1...User.all.size).times do
    user.following_relations.create(followed_id: rand(1...User.all.size))
    User.find(rand(1...User.all.size)).following_relations.create(followed_id: user.id)
  end
end

5.times do
  user = User.find(rand(1..User.all.size))
  rand(1..2).times do
    user.whiistles.create(body: Faker::Quote.most_interesting_man_in_the_world)
  end
end

User.all.find_each do |user|
  avatar = open('https://loremflickr.com/300/300/face')
  user.profile_picture.attach(io: avatar, filename: 'foo.jpg')
  cover = open('https://loremflickr.com/1000/1000/view')
  user.cover_image.attach(io: cover, filename: 'fooo.jpg')
end
