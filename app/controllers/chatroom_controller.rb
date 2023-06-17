class ChatroomController < ApplicationController
  before_action :require_user
  def index
    @message = Message.new
    @messages = Message.order(created_at: :asc).last(50)
    @chat_users = User.all
  end
end
