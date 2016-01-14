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
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
  end
  def update
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
    @bookmark.url = params[:bookmark][:url]

    if @bookmark.save
      flash[:notice] = "Bookmark saved"
      redirect_to @topic
    else 
      flash[:error] = "Bookmark not saved"
      render :edit
    end
  end
  def destroy
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])

    if @bookmark.destroy
       flash[:notice] = "Bookmark deleted"
      redirect_to @topic
    else 
      flash[:error] = "Bookmark not deleted"
      redirect_to @topic
    end
  end

end
