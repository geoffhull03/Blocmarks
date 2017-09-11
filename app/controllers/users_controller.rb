
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
      @topics = Topic.visible_to(current_user).paginate(page: params[:page], per_page: 2)
      @liked_bookmarks =  Bookmark.liked_by(current_user).paginate(page: params[:page], per_page: 8)
    else
      redirect_to new_user_registration_path
    end
  end
end
