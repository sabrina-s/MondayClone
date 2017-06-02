class TweetsController < ApplicationController
  def home
    #@tweet = current_user.tweets.build
    @tweets = Tweet.all
  end

  def new
  end

  def create
    @tweet = current_user.tweets.build(tweet_params)
    @tweet.save
    redirect_to root_path
  end

  def show
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
