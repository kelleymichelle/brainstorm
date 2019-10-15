class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :logged_in?
  helper_method :authenticate_user

  def current_user
    # Inventor.find_by(id: session[:inventor_id]) || Investor.find_by(id: session[:investor_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def authenticate_user
    if !logged_in? 
    redirect_to root_path
    end 
  end  

end
