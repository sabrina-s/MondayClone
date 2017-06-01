class TweetsController < ApplicationController
  def home
    @user = current_user
    @tweet = @user.@tweet.build
  end

  def new
  end

  def create

  end

  def show
  end

  def destroy
  end
end
