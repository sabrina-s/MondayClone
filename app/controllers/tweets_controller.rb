class TweetsController < ApplicationController
  def home
    @tweet = current_user.tweets.build
    @tweets = Tweet.all
  end

  def show
    @tweet = Tweet.find(params[:id])
    @tweet_replies = Tweet.where(Tweet.reply_id = @tweet.id)
  end

  def create
    @tweet = current_user.tweets.build(tweet_params)
    if @tweet.save
      redirect_to root_path
    else
      render :home
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to root_path
  end

  private
  def tweet_params
    params.require(:tweet).permit(:body)
  end
end
