class LikesController < ApplicationController
  # User needs to login before doing the following actions
  before_action :authenticate_user!

  before_action :set_tweet

  def create
    @like = current_user.likes.build(tweet_id: @tweet.id)
    @like.save
    if params[:path] == "tweet"
      redirect_to root_path
    elsif params[:path] == "user"
      redirect_to user_path(current_user.id)
    end
  end

  def destroy
    @like = Like.find_by(tweet_id: @tweet.id, user_id: current_user.id)
    @like.delete
    if params[:path] == "tweet"
      redirect_to root_path
    elsif params[:path] == "user"
      redirect_to user_path(current_user.id)
    end  
  end
  
  private

  def tweet_id
    params.permit(:id)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

end
