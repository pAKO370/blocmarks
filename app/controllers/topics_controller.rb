class TopicsController < ApplicationController

  def index

    @user = User.find(params[:user_id])
    @topics = @user.topics

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

    authorize @topic

    if @topic.save
      flash[:notice] = "Topic saved"
      redirect_to user_topics_path(current_user.id)
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

    authorize @topic

    if @topic.save
      flash[:notice] = "Topic saved"
      redirect_to user_topic_path(user_id: current_user.id,id: @topic.id)
    else
      flash[:alert] = " Topic save failed"
      redirect_to :new
    end
  end

  def destroy
    @topic = Topic.find(params[:id])

    authorize @topic

    if @topic .destroy
      flash[:notice] = "Topic deleted"
      redirect_to user_topics_path(user_id: current_user.id)
    else
      flash[:alert] ="Topic could not be deleted"
      redirect_to topics-path
    end
  end
end
