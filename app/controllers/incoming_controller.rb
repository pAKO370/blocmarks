class IncomingController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    @user = User.find_by(email: params[:sender])
    @topic = Topic.find_by(title: params[:subject].downcase)
  

    if @user == nil
      @email = params[:sender]
      InviteMailer.invite_user(@email).deliver_now
  
    elsif @topic == nil
      puts "topic"  
      @topic = Topic.new
      @topic.title = params[:subject]
      @topic.user = @user

      @bookmark = Bookmark.new(url: params['body-plain'])
      @bookmark.topic = @topic

      @bookmark.save

    else
      @bookmark = Bookmark.new(url: params['body-plain'])
      @bookmark.topic = @topic

      @bookmark.save
    end
    head 200
  end
end
