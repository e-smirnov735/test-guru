class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  helper_method :current_user,
                :logged_in?

  private

  def authenticate_user!
    return if current_user

    session[:path] = request.original_url
    redirect_to login_path, alert: "Вы должны войти в систему"
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end
end
