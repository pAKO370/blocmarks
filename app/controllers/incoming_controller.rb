class IncomingController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    @user = User.find_by(email: params[:sender])
    @topic = Topic.find_by(title: params[:subject])
    @bookmark = Bookmark.new(url: params['body-plain'])

    @bookmark.save
    
    head 200
  end


end
