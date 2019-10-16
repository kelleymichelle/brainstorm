class IdeasController < ApplicationController
  before_action :authenticate_user
  before_action :inventor_account, only: [:new]

  before_action :find_idea, only: [:show, :update]

  # before_action :find_inventor

  def new
    @idea = Idea.new
    @groups = Group.all.order(:name)
  end

  def create
    raise params.inspect
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
