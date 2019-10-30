class SessionsController < ApplicationController

  def new
    #login
  end

  def create
    if auth_hash = request.env['omniauth.auth']
      @account = Account.find_or_create_by_omniauth(auth_hash)
      session[:account] = @account
     
      if 
        new_accountable?(@account) and return
      else 
        @account = Account.find_by(uid: params[:uid])
      end  
    end

      @account = Account.find_by(email: params[:email])
      
      if @account && @account.authenticate(params[:password])
        log_in(@account) and return
          
      else
        flash[:danger] = "Invalid Log in Information"
        render :new
    end  
  end     

def accountable_form
  #renders accountable_form
end

def destroy
    session.clear
    redirect_to '/'
end 

end