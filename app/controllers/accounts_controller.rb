class AccountsController < ApplicationController

  def new
    @account = Account.new
  end

  def create
    # byebug
    @account = Account.new(account_params)
      if @account.accountable_type == "inventor"
        @account.accountable = Inventor.new
      else @account.accountable_type == "investor"
        @account.accountable = Investor.new  
      end  
    if @account.save!
      # byebug
        session[:account_id] = @account.id
        session[:accountable_type] = @account.accountable_type
        session[:accountable_id] = @account.accountable.id
      
        # flash[:success] = "Welcome #{@account.username}!"
        if @account.accountable_type == "inventor"
          redirect_to edit_inventor_path
        else @account.accountable_type == "investor"
          redirect_to edit_investor_path  
        end  
    # else
    #     flash[:danger] = "Oops! There was trouble making your acount."
    #     render 'new'
    end

  end

  private

  def account_params
    params.require(:account).permit(:username, :email, :password, :password_confirmation, :accountable_type)
  end

end
