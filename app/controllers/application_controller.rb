class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  
  helper_method :current_user
  helper_method :logged_in?
  helper_method :authenticate_user
  helper_method :inventor_account
  helper_method :investor_account
  helper_method :dashboard_route
  helper_method :log_in
  helper_method :new_accountable?
  helper_method :find_favorite
  helper_method :favorite?
  helper_method :has_accountable

  private

  def current_user
    Account.find_by(id: session[:account_id])
  end

  def log_in(account)
    session[:account_id] = account.id
    session[:accountable_type] = account.accountable_type
    session[:accountable] = account.accountable
    flash[:success] = "Successfully logged in, Welcome back!"
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

  def dashboard_route
    # byebug
    # if 
    #   !current_user.accountable
    #   flash[:danger] = "Please finish signing up"
    #   accountable_signup
    # else
      if investor_account
        investor_path(current_user.accountable)
      else inventor_account
        inventor_path(current_user.accountable)
      # else
      #   missing_accountable
        # end
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

  def find_favorite(idea_id)
    investor_account.favorites.where(idea_id: idea_id)[0]
  end


  def favorite?(idea)
    self.favorites.find_by_idea_id(idea.id)
  end

  def missing_accountable
    if !current_user.accountable
      flash[:danger] = "Please finish signing up"
      redirect_to sessions_accountable_form_path
    else !current_user.accountable.id
      flash[:danger] = "Please finish signing up"
      accountable_signup
    end  
  end

  def accountable_signup
    if current_user.accountable_type == "Inventor"
      redirect_to new_inventor_path and return
    else current_user.accountable_type == "Investor"
      redirect_to new_investor_path and return
    end  
  end

end
