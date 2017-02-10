class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
  def current_user 
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
  	!!current_user
  end

  def require_user
  	if !logged_in?
  		flash[:danger] = "You must be logged_in"
  		redirect_to root_path
  	end
  end 
  helper_method :logged_in?, :current_user
end
