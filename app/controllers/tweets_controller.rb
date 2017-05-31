class TweetsController < ApplicationController
  def main
    @user = current_user
    @tweet = @user.tweets.build
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
