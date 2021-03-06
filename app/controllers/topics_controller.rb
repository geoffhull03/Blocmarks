class TopicsController < ApplicationController
  include TopicsHelper
  before_action :authenticate_user!
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new
    @topic.title = params[:topic][:title]
    @topic.user = current_user

    if @topic.save
      redirect_to @topic
    else
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    @topic.assign_attributes(topic_params)

    if @topic.save
      redirect_to @topic
    else
      render :edit
    end
  end

  def destroy
     @topic = Topic.find(params[:id])

     if @topic.destroy
       redirect_to action: :index
     else
       render :show
     end
  end

  private

  def topic_params
    params.require(:topic).permit(:title)
  end
end
