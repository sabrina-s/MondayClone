class TweetsController < ApplicationController

  # Find params before the following actions
  before_action :set_tweet, only: [:show, :destroy]

  # User needs to login before doing the following actions
  before_action :authenticate_user!, only: [:home, :show, :create, :destroy]

  def home
    @tweet = current_user.tweets.build(new_tweet_params)
    @tweets = Tweet.all
  end

  def search
    @search = params[:search]

    if params[:search]
      @tweets = Tweet.search(params[:search])
    end
  end

  def show
    @tweet_replies = Tweet.where(reply_id: @tweet.id)
  end

  def reply
    redirect_to root_path(reply_params)
  end

  def create
    @tweet = current_user.tweets.build(tweet_params)
    @tweets = Tweet.all

    respond_to do |format|
      if @tweet.save
        Tweet.save_hashtag(@tweet)
        format.js
      else
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
    params.require(:tweet).permit(:body, :reply_id, :image)
  end

  def new_tweet_params
    params.permit(:body, :reply_id, :image)
  end

  def reply_params
    {:reply_id => params[:reply_to_tweet_id], :body => "@" + User.find(params[:reply_to_user_id]).username + " "}
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

end
