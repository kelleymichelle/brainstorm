class IdeasController < ApplicationController
  before_action :authenticate_user
  before_action :inventor_account, only: [:new]
  

  before_action :find_idea, only: [:show, :update]

  # before_action :find_inventor

  def index
    @ideas = Idea.all
  end
  
  def show
    
  end

  def new
    if !inventor_account
      redirect_to dashboard_route
    else  
      @idea = Idea.new
      @groups = Group.all.order(:name)
    end
  end

  def create
    # raise params.inspect
    # byebug
    @idea = inventor_account.ideas.build(idea_params)
    if @idea.save!
      redirect_to inventor_idea_path(inventor_account, @idea), notice: "Brainstorm!"
    else 
      redirect_to new_item_path
    end   
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :description, :fund_goal, :group_id)
  end

  def find_idea
    @idea = Idea.find(params[:id])
  end

  # def find_inventor
  #   @inventor = Inventor = Inventor.find(params[:id])
  # end

end
