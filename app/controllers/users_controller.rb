class UsersController < ApplicationController
  # User needs to login before doing the following actions
  before_action :authenticate_user!

  before_action :set_user
  # def index
  #   @users = User.all
  # end

  def show
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

    @following = @user.following.count
  end

  def following
    @title = "Following"
    @users = @user.following
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @users = @user.followers
    render 'show_follow'
  end

  private

  def set_user
    @user = User.find_by(username: params[:username])
  end
end
