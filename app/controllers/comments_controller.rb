class CommentsController < ApplicationController
  before_action :inventor_account
  before_action :authenticate_user
  before_action :find_idea

  # def new

  # end

  def create
    # byebug
    # raise params.inspect
    @comment = @idea.comments.build(comment_params)
    @comment.inventor = inventor_account
    if @comment.save!
      redirect_to idea_path(@comment.idea)
    # else
      
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:text)
  end

  def find_idea
    @idea = Idea.find(params[:id])
  end

end
