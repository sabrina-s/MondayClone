# Users - Create Admin
User.find_or_create_by(username: "Admin") do |user|
  user.username = "admin"
  user.email = "admin@admin.com"
  user.password = "password"
  is_admin = 1
end

# Users - Random users
user_count = 10
if User.count < user_count
  (user_count - User.count).times do
    username = Faker::Pokemon.name
    email = Faker::Internet.email
    is_admin = Faker::Number.between(0,1)
    User.create( username: username, email: email, password: 'password', is_admin: is_admin )
  end
end

# Tweets - Create Tweets
tweet_count = 100
if Tweet.count < tweet_count
  (tweet_count - Tweet.count).times do
    body = Faker::ChuckNorris.fact
    offset = rand(User.count)
    user_id = User.offset(offset).limit(1).first.id
    Tweet.create(body: body, user_id: user_id)
  end
end