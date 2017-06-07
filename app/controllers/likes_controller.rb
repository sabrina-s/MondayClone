class LikesController < ApplicationController
  def create
    @tweet = Tweet.find(params[:id])
    @like = current_user.likes.build(@tweet)
    @like.save

    redirect_to root_path
    #
    # if Like.find_by(tweet_id: @tweet.id, user_id: current_user) != nil
    #   @like = Like.find_by(tweet_id: @tweet.id, user_id: current_user)
    #   redirect_to like_path(@like.id, method: :delete)
    # else
    #   @like = @tweet.likes.build(user_id: current_user.id)
    #   if @like.save
    #     redirect_to root_path
    #   else
    #     redirect_to root_path
    #   end
    # end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @like = Like.find_by(tweet_id: @tweet.id, user_id: current_user.id)
    @like.delete

    redirect_to root_path
  end

end
