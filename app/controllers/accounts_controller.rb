class AccountsController < ApplicationController

  def new
    @account = Account.new
  end

  def create
    
    @account = Account.new(account_params)
      if @account.accountable_type == "Inventor"
        @account.accountable = Inventor.new
      else @account.accountable_type == "Investor"
        @account.accountable = Investor.new  
      end  
      
    if @account.save!
      
        session[:account_id] = @account.id
        session[:accountable_type] = @account.accountable_type
        session[:accountable_id] = @account.accountable.id
      
        # flash[:success] = "Welcome #{@account.username}!"
        if @account.accountable_type == "Inventor"
          # @account.accountable = Inventor.new
          redirect_to new_inventor_path
        else @account.accountable_type == "Investor"
          # @account.accountable = Investor.new
          redirect_to new_investor_path
        end  
    else
    #     flash[:danger] = "Oops! There was trouble making your acount."
        render 'new'
    end
  end

  def create_from_fb
    
    @account = Account.new(session[:account])
    @account.accountable_type = params[:account][:accountable_type]
    if @account.accountable_type == "Inventor"
      @account.accountable = Inventor.new
    else @account.accountable_type == "Investor"
      @account.accountable = Investor.new  
    end 
    
    if @account.save!
      # byebug
        session[:account_id] = @account.id
        session[:accountable_type] = @account.accountable_type
        session[:accountable_id] = @account.accountable.id
      
        # flash[:success] = "Welcome #{@account.username}!"
        if @account.accountable_type == "Inventor"
          # @account.accountable = Inventor.new
          redirect_to new_inventor_path
        else @account.accountable_type == "Investor"
          # @account.accountable = Investor.new
          redirect_to new_investor_path
        end  
    else
    #     flash[:danger] = "Oops! There was trouble making your acount."
        render 'new'
    end
    # raise params.inspect

  end

  def update

  end

  private

  def account_params
    params.require(:account).permit(:username, :email, :password, :password_confirmation, :accountable_type, :uid)
  end

end
