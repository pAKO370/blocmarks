class IncomingController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    puts "INCOMING PARAMS: #{params}"

    @user = User.find(params[:sender])
    @topic = Topic.find(params[:subject])

    unless @topic.exists?


end
