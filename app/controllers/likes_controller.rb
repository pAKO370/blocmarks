class LikesController < ApplicationController

  def new
    like = Like.new
  end

  def create 
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: @bookmark)
    @topic = @bookmark.topic

    authorize like

    if like.save
      flash[:notice] = "You liked the bookamrk"
      redirect_to :back
    else
      flash[:alert] ="Like didnt work"
      redirect_to user_topics_path(current_user.id)
    end
  end
  
  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.find(params[:id])
    @topic = @bookmark.topic

     authorize like

    if like.destroy
      flash[:notice] = "Bookmark unliked"
      redirect_to :back
    else
      flash[:notice] = "Unlike failed"
      redirect_to user_topics_path(current_user.id)
    end
  end
end
