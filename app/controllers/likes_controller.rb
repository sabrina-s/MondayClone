class LikesController < ApplicationController
  def create
    @tweet = Tweet.find(params[:id])
    @like = current_user.likes.build(:tweet_id => tweet_id[:id])
    @like.save
    if params[:path] == "tweet"
      redirect_to root_path
    elsif params[:path] == "user"
      redirect_to user_path(current_user.id)
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
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

end
