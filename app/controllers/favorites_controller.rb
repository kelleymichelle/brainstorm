class FavoritesController < ApplicationController

  # before_action :find_investor
  # respond_to :js

  def index
    @investor = investor_account
  end

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

  def edit
    # raise params.inspect
    # byebug
    @idea = Idea.find(params[:idea_id])
    @favorite = find_favorite(@idea)
    # byebug
  end

  def update
    # byebug
    @fav = investor_account.favorites.find(params[:id])
    @fav.notes = params[:favorite][:notes]
    if @fav.save
      flash[:success] = "Notes updated"
    else
      flash[:danger] = "Sorry, something went wrong"  
    end  
    
    redirect_to investor_favorites_path(investor_account)
  end

  private

  def note_params
    params.require(:favorite).permit(:notes, :id)
  end


end
