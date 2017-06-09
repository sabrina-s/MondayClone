class UsersController < ApplicationController
  # def index
  #   @users = User.all
  # end

  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets
    @likes = @user.likes
  end
end
