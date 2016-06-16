class MessagesController < ApplicationController
  before_action :logged_in_staff, only: [:index]
  
  def new
    @message = Message.new
  end
  
  def create
    @message = Message.new(message_params)
    if @message.save
      flash[:success] = "Message Sent!"
      redirect_to "/home"
    else
      render 'new'
    end
  end

  def index
    @messages = Message.all
  end
  
  private
  
  def message_params
      params.require(:message).permit(:subject, :target, :content, :from)
  end
end
