class BookmarksController < ApplicationController
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def index
  end

  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.build(bookmark_params)
    @bookmark.user = current_user

      if @bookmark.save
        flash[:notice] = "Bookmark was saved."
        redirect_to @topic
      else
        flash[:error] = "There was an error saving the bookmark. Please try again."
        render :new
      end
   end

  def edit
    @bookmark = Bookmark.find(params[:id])
  end

  def update
   @topic = Topic.find(params[:topic_id])
   @bookmark = Bookmark.find(params[:id])
   @bookmark.assign_attributes(bookmark_params)
   authorize @bookmark


   if @bookmark.save
     flash[:notice] = "Bookmark was updated."
     redirect_to topic_path(@topic)
   else
     flash[:error] = "There was an error saving this bookmark. Please try again."
     render :edit
   end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark

    if @bookmark.destroy
      flash[:notice] = "\"#{@bookmark.url}\" was deleted successfully."
      redirect_to topics_path(@topic)
    else
      flash[:error] = "There was an error deleting the bookmark."
      render :show
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:url)
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
end
