class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :logged_in?
  helper_method :authenticate_user
  helper_method :inventor_account
  helper_method :investor_account

  private
  
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

  def inventor_account
    current_user.accountable_type == "inventor"
  end

  def investor_account
    current_user.accountable_type == "investor"
  end

end
