class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to start_path(session[:path])
    else
      flash.now[:alert] = "Неправильный логин или пароль"
      render :new
    end
  end

  def destroy
    if logged_in?
      session.delete(:user_id)
      @current_user = nil
    end

    redirect_to login_path
  end

  private

  def start_path(path)
    path && path != login_path ? path : tests_path
  end
end
