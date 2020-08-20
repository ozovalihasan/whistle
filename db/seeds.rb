# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
20.times do
  User.create(
    username: Faker::Name.name.split(' ').join.downcase,
    fullname: Faker::Name.name,
    email: Faker::Internet.email,
    password: 'aaaaaa',
    password_confirmation: 'aaaaaa'
  )
end

User.create([{ username: 'hillary', email: 'hillary@hillary.hillary', password: 'aaaaaa', password_confirmation: 'aaaaaa' },
             { username: 'hasan', email: 'hasan@hasan.hasan', password: 'aaaaaa', password_confirmation: 'aaaaaa' },
             { username: 'dila', email: 'dila@dila.dila', password: 'aaaaaa', password_confirmation: 'aaaaaa' }])
User.first.following_relations.create(followed_id: User.second.id)
User.first.following_relations.create(followed_id: User.third.id)
User.second.following_relations.create(followed_id: User.third.id)
User.first.whiistles.create(body: 'Etiam ut eleifend nisl. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.')
User.second.whiistles.create(body: 'Aliquam consectetur felis a accumsan dignissim. Phasellus sed luctus orci, ut laoreet mi. Sed eu dui gravida, porta massa in, mattis tellus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quam massa, eleifend eget finibus sed, aliquet sed sem. Mauris vitae est metus. Sed velit orci, ullamcorper suscipit feugiat egestas, sollicitudin egestas ex. Nunc accumsan non magna sed egestas. Aenean vel lacinia mi. ')
User.third.whiistles.create(body: 'Vivamus nec scelerisque lectus, at laoreet nulla. Vivamus ac venenatis mauris. Praesent venenatis aliquet risus tristique convallis. Ut ut risus mollis, interdum lectus vel, condimentum eros. Mauris facilisis fermentum sapien nec vestibulum. Etiam tempor odio id metus varius lacinia. Nunc nec pulvinar ipsum. Cras viverra, elit vitae ullamcorper aliquet, turpis augue laoreet tellus, sed iaculis nibh est ac ipsum. Cras vel massa ante. Mauris a eros non erat congue ullamcorper ut non ex. ')
