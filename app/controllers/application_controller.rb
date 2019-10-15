class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :logged_in?
  helper_method :authenticate_user
  helper_method :is_inventor?

  def current_user
    Account.find_by(id: session[:account_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def authenticate_user
    if !logged_in? 
    redirect_to root_path
    end 
  end  

  def is_inventor?
    current_user.accountable_type == "inventor"
  end

  def is_investor?
    current_user.accountable_type == "investor"
  end

end
