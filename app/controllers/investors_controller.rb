class InvestorsController < ApplicationController

  before_action :authenticate_user
  before_action :investor_account, except: [:index, :show] 

  before_action :find_investor, only: [:show, :update]

  def index
    @investors = Investor.all
  end

  def show
    #individual show page
  end

  def edit
    @investor = current_user.accountable
  end

  def update
    if @investor.update(investor_params)
      redirect_to investor_path(@investor)
    else
      render :edit
    end    
  end

  private

  def investor_params
    params.require(:investor).permit(:name, :location, :bio)
  end

  def find_investor
    @investor = Investor.find(params[:id])
  end

end
