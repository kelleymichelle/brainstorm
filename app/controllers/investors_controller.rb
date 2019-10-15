class InvestorsController < ApplicationController

  def new
  
  end
  
  def create
    @investor = Investor.create(user_params)
    return redirect_to controller: 'investors', action: 'new' unless @investor.save
    session[:user_id] = @investor.id
    redirect_to controller: 'welcome', action: 'home'
  end

  def investor_params
    params.require(:investor).permit(:name, :email, :password, :password_confirmation, :bio)
  end
end
