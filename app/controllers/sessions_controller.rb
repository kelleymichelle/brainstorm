class SessionsController < ApplicationController

  def new

  end

  def create
    @account = Account.find_by(username: params[:username])
    
    if @account && @account.authenticate(params[:password])
        session[:account_id] = @account.id
        session[:accountable_type] = params[:accountable_type]
    else
        render 'new'
    end     
end

def destroy
    session.clear
    redirect_to '/'
end 

end