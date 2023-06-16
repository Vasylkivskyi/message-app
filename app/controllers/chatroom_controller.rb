class ChatroomController < ApplicationController
  before_action :can_view?
  def index
    @messages = Message.all
  end

  private

  def can_view?
    redirect_to login_path if !logged_in?
  end
end
