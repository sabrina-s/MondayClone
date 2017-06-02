class TweetsController < ApplicationController
  def main
    @tweet = current_user.tweets.build
    @tweets = Tweet.all
  end

  def new
  end

  def create
    @tweet = current_user.tweets.build(tweet_params)
    @tweet.save
  end

  def show
  end

  def destroy
  end

  private
  def tweet_params
    params.require(:tweet).permit(:body)
  end
end
