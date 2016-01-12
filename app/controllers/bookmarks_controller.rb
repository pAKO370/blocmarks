class BookmarksController < ApplicationController
  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
  end
  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
    @bookmark.url = params[:bookmark][:url]

    @bookmark.topic = @topic
  

    if @bookmark.save
      flash[:notice] = "Bookmark was created"
      redirect_to @topic
    else
      flash[:error] =" Bookmark not saved"
      render :new
    end
  end

  def edit
  end
end
