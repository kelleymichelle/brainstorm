class FavoritesController < ApplicationController
  # respond_to :js

  def create
    # byebug
    @user = investor_account
    @idea = Idea.find(params[:idea_id])
    @user.favorite!(@idea)
    # byebug
    redirect_to idea_path(@idea)
  end

  def unfavorite
    # byebug
    @user = investor_account
    @favorite = @user.favorites.find_by_idea_id(params[:idea_id])
    @idea = Idea.find(params[:idea_id])
    @favorite.destroy!
    redirect_to idea_path(@idea)
  end


end
