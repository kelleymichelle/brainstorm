class AccountsController < ApplicationController

  def new
    @account = Account.new
  end

  def create
    
    @account = Account.new(account_params)

    behind_the_scenes_creation
  
  end

  def create_from_fb
    
    @account = Account.new(session[:account])
    @account.accountable_type = params[:account][:accountable_type]

    behind_the_scenes_creation
  
  end

  # def update

  # end

  private

  def account_params
    params.require(:account).permit(:username, :email, :password, :password_confirmation, :accountable_type, :uid)
  end

  def behind_the_scenes_creation
    if @account.accountable_type == "Inventor"
      @account.accountable = Inventor.new
    else @account.accountable_type == "Investor"
      @account.accountable = Investor.new  
    end 
    if @account.save
        session[:account_id] = @account.id
        session[:accountable_type] = @account.accountable_type
        session[:accountable_id] = @account.accountable.id
        if @account.accountable_type == "Inventor"
          redirect_to new_inventor_path
        else @account.accountable_type == "Investor"
          redirect_to new_investor_path
        end  
    else
        flash[:errors] = @account.errors.full_messages
        render 'new'
    end
  end

end
