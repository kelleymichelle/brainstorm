class AccountsController < ApplicationController

  def new
    @account = Account.new
  end

  def create
    # byebug
    @account = Account.new(account_params)
    if @account.save!
        session[:account_id] = @account.id
        session[:accountable_type] = @account.accountable_type
        # flash[:success] = "Welcome #{@account.username}!"
        if @account.accountable_type == "inventor"
          redirect_to root_path
        else @account.accountable_type == "investor"
          redirect_to root_path  
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
