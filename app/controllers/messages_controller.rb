class MessagesController < ApplicationController
  include ActionView::Helpers::DateHelper
  def create
    @message = current_user.messages.build(message_params)
    # http implementation
    # redirect_to root_path if @message.save

    # websocket implementation
    if @message.save
      ActionCable.server.broadcast "chatroom_channel",
                                   {
                                     message: {
                                       body: @message.body,
                                       created:
                                         time_ago_in_words(@message.created_at),
                                       user: @message.user
                                     }
                                   }
    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
