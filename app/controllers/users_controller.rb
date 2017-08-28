class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new
  end

  def show
    if current_user
      @user = params[:id] ? User.find(params[:id]) : current_user
      @user_bookmarks = @user.bookmarks
    else
      redirect_to new_user_registration_path
    end
  end
end
