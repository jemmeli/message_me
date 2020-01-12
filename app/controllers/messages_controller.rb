class MessagesController < ApplicationController
  before_action :require_user

  def create
    message = current_user.messages.build(message_params)#like create hit the db
    if message.save
      #redirect_to root_path

      #any thing you broadcast will caught by coofee script function recieved#data
      #ActionCable.server.broadcast "chatroom_channel",foo: message.body

      ActionCable.server.broadcast "chatroom_channel",mod_message: message_render(message)
    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end

  def message_render(message)
    #render partial from controller / my partial need message inside it see messages/message.html.erb
    render(partial: 'message', locals: {message: message})
  end

end