class IncomingController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    @user = User.find_by(email: params[:sender])

    if @user == nil
      @email = params[:sender]
      InviteMailer.invite_user(@email).deliver_now
    else
      @topic = Topic.find_by(title: params[:subject].downcase)

      if @topic == nil
        @topic = Topic.new(title: params[:subject])
      end

      @bookmark = Bookmark.new(url: params['body-plain'])
      @bookmark.topic = @topic

      @bookmark.save
    end
    
    head 200
  end


end
