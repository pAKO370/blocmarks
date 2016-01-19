class LikesController < ApplicationController

  def create 
    @user = current_user
    @bookmark = Bookmark.find(params[:id])
    like = @user.likes.build(bookmark: @bookmark)

    if like.save
      flash[:notice] = "You liked the bookamrk"
      redirect_to topics_path
    else
      flash[:alert] ="Like didnt work"
      redirect_to topics_path
    end
  end
  def destroy
    @bookmark = Bookmark.find(params[:id])
    like = current_user.likes.find(params[:id])

    if like.destroy
      flash[:notice] = "Bookmark unliked"
      redirect_to topics_path
    else
      flash[:notice] = "Unlike failed"
      redirect_to topics_path
  end
end
