class TweetsController < ApplicationController

  # Find params before the following actions
  before_action :set_tweet, only: [:show, :destroy]

  # User needs to login before doing the following actions
  before_action :authenticate_user!, only: [:home, :show, :create, :destroy]

  def home
    @tweet = current_user.tweets.build
    @tweets = Tweet.all
  end

  def show
    @tweet_replies = Tweet.where(reply_id: @tweet.id)
  end

  def create
    @tweet = current_user.tweets.build(tweet_params)
    @tweets = Tweet.all

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to root_path }
        format.js
      else
        format.html { render :home }
        format.js
      end
    end
  end

  def destroy
    @tweet.destroy
    redirect_to root_path
  end

  private
  def tweet_params
    params.require(:tweet).permit(:body)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

end
