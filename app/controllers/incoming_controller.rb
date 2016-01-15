class IncomingController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    puts "INCOMING PARAMS: #{params}"

    # @user = (params[:sender])
    # @topic = params[:subject])

  end


end
