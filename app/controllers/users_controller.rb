class UsersController < ApplicationController
  # User needs to login before doing the following actions
  before_action :authenticate_user!
  
  # def index
  #   @users = User.all
  # end

  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets
    @tweets_count = @tweets.count
    @likes = @user.likes
    @likes_count = @likes.count
    @likes.each do |like|
      tweet = Tweet.find(like.tweet_id)
      if tweet.user_id == @user.id
        @likes_count -= 1
      end
    end
  end

end
