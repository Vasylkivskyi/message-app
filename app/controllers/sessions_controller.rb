class SessionsController < ApplicationController
  before_action :logged_in_redirect, only: %i[new create]
  def new
  end

  def create
    sessions_params = params[:session].permit(:username, :password)
    @user = User.find_by(username: sessions_params[:username])
    if @user && @user.authenticate(sessions_params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash.now[:error] = "Login is invalid!"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
