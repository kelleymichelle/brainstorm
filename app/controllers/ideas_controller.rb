class IdeasController < ApplicationController
  before_action :authenticate_user
  before_action :inventor_account, only: [:new]
  before_action :has_accountable?
  
  before_action :find_idea, only: [:show, :edit, :update]

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
    @idea = inventor_account.ideas.build(idea_params)
    if @idea.save
      flash[:success] = "Great Idea!"
      redirect_to inventor_idea_path(inventor_account, @idea), notice: "Brainstorm!"
    else 
      flash[:errors] = @idea.errors.full_messages
      redirect_to new_idea_path
    end   
  end

  def edit
    inventor_check(@idea)
  end

  def update
    if @idea.update(idea_params)
      flash[:success] = "Idea successfully updated!"
      render :show
    else
      flash[:errors] = @idea.errors.full_messages  
    end
  end

  def most_popular
    @idea = Idea.most_popular
    flash[:popular] = "Most Popular Idea!"
    render :show
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :description, :fund_goal, :group_id)
  end

  def find_idea
    @idea = Idea.find(params[:id])
  end

  def inventor_check(idea)
    if !current_user.accountable.ideas.include?(idea)
      flash[:danger] = "Access Denied!"
      render :show
    end
  end

end
