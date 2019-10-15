class SessionsController < ApplicationController

  def new

  end

  def create
    # @user = Inventor.find_by(name: params[:name]) || Investor.find_by(name: params[:name])
    
    # if @user && @user.authenticate(params[:password])
    #     session[:user_id] = @user.id
    #     redirect_to investor_path(@user) || inventor_path(@user)
    # else
    #     render 'new'
    # end     
end

def destroy
    session.clear
    redirect_to '/'
end 

end