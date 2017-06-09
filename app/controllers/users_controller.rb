class UsersController < ApplicationController
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
      if tweet.user_id == current_user.id
        @likes_count -= 1
      end
    end
  end

end
