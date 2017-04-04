class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Come on in, #{user.email}"
      redirect_to root_path
    else
      flash.now[:danger] = "Invalid, try again."
      redirect_to login_path
    end
  end

  def destroy
    session.clear

    redirect_to root_path, success: "Bye!"
  end

end