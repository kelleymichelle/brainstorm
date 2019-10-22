class SessionsController < ApplicationController

  def new

  end

  def create
    if auth_hash = request.env['omniauth.auth']
      # byebug
      @account = Account.find_or_create_by_omniauth(auth_hash)
      session[:account] = @account
      # byebug
      # partial with edit accountable form
      if 
        new_accountable?(@account) and return
        # render :accountable_form
      # else
      #   log_in(@account)
        # redirect_to dashboard_route
      # end
      else 
        @account = Account.find_by(uid: params[:uid])
      end  
    end
      if @account && @account.authenticate(params[:password])
          log_in(@account) and return
          # session[:account_id] = @account.id
          # session[:accountable_type] = params[:accountable_type]
          
          # if inventor_account
          #   redirect_to inventor_path(@account.accountable)
          # else investor_account
          #   redirect_to investor_path(@account.accountable)  
          # end  
          # redirect_to dashboard_route
      # end  
      else
        # render 'new'
        redirect_to new_account_path and return
    end  
  end     
# end

def destroy
    session.clear
    redirect_to '/'
end 

end