class InventorsController < ApplicationController

  before_action :authenticate_user
  before_action :inventor_account, except: [:index, :show]

  before_action :find_inventor, only: [:show, :update]


  def index
    @inventors = Inventor.all
  end

  def show
    #inventor individual homepage
  end

  def edit
    @inventor = current_user.accountable
  end

  def update
    if @inventor.update(inventor_params)
      redirect_to inventor_path(@inventor)
    else  
      render :edit
    end  
  end

  private

  def inventor_params
    params.require(:inventor).permit(:name, :location, :bio)
  end

  def find_inventor
    @inventor = Inventor.find(params[:id])
  end


end
