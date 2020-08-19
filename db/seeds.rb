# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create([{ username: 'hillary', email: 'hillary@hillary.hillary', password: 'aaaaaa', password_confirmation: 'aaaaaa' },
             { username: 'hasan', email: 'hasan@hasan.hasan', password: 'aaaaaa', password_confirmation: 'aaaaaa' },
             { username: 'dila', email: 'dila@dila.dila', password: 'aaaaaa', password_confirmation: 'aaaaaa' }])

User.first.following_relations.create(followed_id: User.second.id)
User.first.following_relations.create(followed_id: User.third.id)
User.second.following_relations.create(followed_id: User.third.id)
User.second.whiistles.create(body: 'Hi everyone')
User.third.whiistles.create(body: 'What a nice day')
