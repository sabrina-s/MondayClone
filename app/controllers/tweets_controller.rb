class TweetsController < ApplicationController
  def home
    @tweet = current_user.tweets.build(new_tweet_params)
    @tweets = Tweet.all
  end

  def show
    @tweet = Tweet.find(params[:id])
    @tweet_replies = Tweet.where(reply_id: @tweet.id)
  end

  def reply
    redirect_to root_path(reply_params)
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
    params.require(:tweet).permit(:body, :reply_id)
  end

  def new_tweet_params
    params.permit(:body, :reply_id)
  end

  def reply_params
    {:reply_id => params[:reply_to_tweet_id], :body => "@" + User.find(params[:reply_to_user_id]).username + " "}
  end
end
