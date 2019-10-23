class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :logged_in?
  helper_method :authenticate_user
  helper_method :inventor_account
  helper_method :investor_account
  helper_method :dashboard_route
  helper_method :log_in
  helper_method :new_accountable

  private

  def current_user
    Account.find_by(id: session[:account_id])
  end

  def log_in(account)
    session[:account_id] = account.id
    session[:accountable_type] = account.accountable_type
    session[:accountable] = account.accountable
    redirect_to dashboard_route
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
    if current_user.accountable_type == "Inventor"
      current_user.accountable
    end
  end

  def investor_account
    if current_user.accountable_type == "Investor"
      current_user.accountable
    end
  end

  #in application helper file
  def dashboard_route
    if investor_account
      investor_path(current_user.accountable)
    else inventor_account
      inventor_path(current_user.accountable)
    end    
  end

  def new_accountable?(act)
    # act = session[:account]
    if act.accountable == nil
      # render 'sessions/accountable_form'
      redirect_to sessions_accountable_form_path
    else
      log_in(act)  
    end  
  end

end
