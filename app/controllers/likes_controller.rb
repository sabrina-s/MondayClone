class LikesController < ApplicationController
  # User needs to login before doing the following actions
  before_action :authenticate_user!

  before_action :set_tweet

  def create
    @like = current_user.likes.build(tweet_id: @tweet.id)
    @like.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @like = Like.find_by(tweet_id: @tweet.id, user_id: current_user.id)
    @like.delete
    redirect_back(fallback_location: root_path)
  end
  
  private

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

end
