class IdeasController < ApplicationController
  before_action :authenticate_user
  before_action :is_inventor? only: [:new]

  before_action :find_idea, only: [:show, :update]

  # before_action :find_inventor

  def new
    @idea = Idea.new
  end

  def create
    raise params.inspect
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :description, :fund_goal)
  end

  def find_idea
    @idea = Idea.find(params[:id])
  end

  # def find_inventor
  #   @inventor = Inventor = Inventor.find(params[:id])
  # end

end
