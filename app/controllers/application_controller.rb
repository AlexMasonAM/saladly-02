class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id]["$oid"])
    end
  end
  helper_method :current_user

  def authorize
    if  current_user == nil
      flash[:danger] = "You must log in first"
      redirect_to login_path
    end
  end

end
