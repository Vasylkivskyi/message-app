class SessionsController < ApplicationController
  def new
  end

  def create
    sessions_params = params[:session].permit(:username, :password)
    @user = User.find_by(username: sessions_params[:username])
    if @user && @user.authenticate(sessions_params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:error] = "Login is invalid!"
      render :new, status: :unprocessable_entity
    end
  end
end
