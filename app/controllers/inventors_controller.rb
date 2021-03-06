class InventorsController < ApplicationController

  before_action :authenticate_user
  before_action :inventor_account, except: [:index, :show]
  before_action :has_accountable?, except: [:new, :create]

  before_action :find_inventor, only: [:show, :edit, :update]

  before_action :does_accountable_exist?, only: [:new]


  def show
    #inventor individual homepage
  end

  def index
    @inventors = Inventor.all
  end

  def new
    @inventor = Inventor.new
  end

  def create
    @inventor = Inventor.new(inventor_params)
    @inventor.account = Account.find(session[:account_id])
    if @inventor.save
      flash[:success] = "Welcome #{@inventor.name}!"
      redirect_to inventor_path(@inventor)
    else
      flash[:errors] =  @inventor.errors.full_messages
      render :new
    end  
  end  

  def edit
    
  end

  def update
    if @inventor.update(inventor_params)
      flash[:success] = "Your info successfully updated!"
      render :show
    else
      flash[:errors] = @inventor.errors.full_messages  
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
