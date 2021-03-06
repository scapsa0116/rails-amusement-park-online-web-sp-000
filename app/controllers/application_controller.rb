class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

private
    def current_user
      User.find(session[:user_id])
    end
    
  #   def current_user
  #     current_user ||= User.find(session[:user_id]) if session[:user_id]
  # end
  def logged_in?
    session[:user_id].present?
  end

  def is_user_authenticated?
    !!current_user
  end
end
