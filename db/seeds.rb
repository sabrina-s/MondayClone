# Users - Create Admin
User.find_or_create_by(username: "administrator") do |user|
  user.username = "administrator"
  user.email = "admin@admin.com"
  user.password = "password"
  is_admin = 1
end

# Users - Random users
user_count = 80
if User.count < user_count
  (user_count - User.count).times do
    username = Faker::Pokemon.name
    email = Faker::Internet.email
    is_admin = Faker::Number.between(0,1)
    User.create( username: username, email: email, password: 'password', is_admin: is_admin )
  end
end

# Tweets - Create Tweets
Tweet.create(body: Faker::ChuckNorris.fact, user_id: User.first.id)
tweet_count = 100
if Tweet.count < tweet_count + 1
  (tweet_count - Tweet.count).times do
    body = Faker::ChuckNorris.fact
    user_offset = rand(User.count)
    user_id = User.offset(user_offset).first.id
    tweet_offset = rand(Tweet.count)
    reply_id = Tweet.offset(tweet_offset).first.id
    Tweet.create(body: body, user_id: user_id, reply_id: reply_id)
  end
end

# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }