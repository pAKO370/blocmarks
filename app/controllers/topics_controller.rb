class TopicsController < ApplicationController

  def index
    if current_user
    @user = current_user
    @topics = @user.topics
  else
  end
    
    
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
      flash[:notice] = "Topic saved"
      redirect_to topics_path
    else
      flash[:alert] = " Topic save failed"
      render :new
    end

  end

  def edit
    @topic = Topic.find(params[:id])
    
  end
  def update
    @topic = Topic.find(params[:id])
    @topic.title = params[:topic][:title]

    if @topic.save
      flash[:notice] = "Topic saved"
      redirect_to topics_path
    else
      flash[:alert] = " Topic save failed"
      redirect_to :new
    end
  end

  def destroy
    @topic = Topic.find(params[:id])

    if @topic .destroy
      flash[:notice] = "Topic deleted"
      redirect_to topics_path
    else
      flash[:alert] ="Topic could not be deleted"
      redirect_to topics-path
    end
  end
end
