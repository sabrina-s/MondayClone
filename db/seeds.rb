# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  username = Faker::Pokemon.name
  email = Faker::Internet.email
  User.create(username: username, email: email, password: "password123", is_admin: 0)
end

10.times do
  body = Faker::ChuckNorris.fact
  user_id = Faker::Number.between(1, 10)
  Tweet.create(body: body, user_id: user_id)
end
