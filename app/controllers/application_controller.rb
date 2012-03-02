class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :login_user! 

  helper_method :current_user, :current_user?

  def current_user
    @current_user ||= User.find_by_id(cookies[:user_id]) # rescue nil
  end

  def current_user?
    current_user.present?
  end

  def login_user!
    if current_user.nil? 
      redirect_to login_url
    end
  end

  def logout
    cookies.delete(:user_id)
    redirect_to login_url
  end
  
end
