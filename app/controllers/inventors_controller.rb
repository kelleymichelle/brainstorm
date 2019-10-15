class InventorsController < ApplicationController

  def show
    raise params.inspect
  end

  def new
    
  end
  
  def create
    @inventor = Inventor.create(inventor_params)
    return redirect_to controller: 'inventors', action: 'new' unless @inventor.save
    session[:inventor_id] = @inventor.id
    redirect_to @inventor
    # redirect_to controller: 'welcome', action: 'home'
  end

  def inventor_params
    params.require(:inventor).permit(:name, :email, :password, :password_confirmation, :bio)
  end
end
