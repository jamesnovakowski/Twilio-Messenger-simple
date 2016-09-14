class MessagesController < ApplicationController

  def new
  end

  def create
    number_to_send_to = params[:message][:number_to_send_to]
    message_to_send = params[:message][:message_to_send]
    TwilioMessageSender.send message_to_send, to: number_to_send_to
  end
  
end
