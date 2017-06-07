class LikesController < ApplicationController
  def create
    @tweet = Tweet.find(params[:id])
    @like = current_user.likes.build(:tweet_id => tweet_id[:id])
    @like.save

    redirect_to root_path
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @like = Like.find_by(tweet_id: @tweet.id, user_id: current_user.id)
    @like.delete

    redirect_to root_path
  end

  private

  def tweet_id
    params.permit(:id)
  end

end
