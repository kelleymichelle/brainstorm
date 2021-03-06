class InvestorsController < ApplicationController

  before_action :authenticate_user
  before_action :investor_account, except: [:index, :show] 
  before_action :has_accountable?, except: [:new, :create]

  before_action :find_investor, only: [:show, :edit, :update]

  before_action :does_accountable_exist?, only: [:new]


  def show
    #individual show page
  end

  def index
    @investors = Investor.all
  end

  def new
    @investor = Investor.new
  end

  def create
    @investor = Investor.new(investor_params)
    @investor.account = Account.find(session[:account_id])
    if @investor.save
      flash[:success] = "Welcome #{@investor.name}!"
      redirect_to investor_path(@investor)
    else
      flash[:errors] = @investor.errors.full_messages
      render :new
    end  
  end

  def edit
    
  end

  def update
    if @investor.update(investor_params)
      flash[:success] = "Your info successfully updated!"
      render :show
    else
      flash[:errors] = @investor.errors.full_messages  
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
