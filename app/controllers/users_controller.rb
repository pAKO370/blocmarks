class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = current_user
    @topics = @user.topics
    @bookmarks = @user.bookmarks
  end
end
