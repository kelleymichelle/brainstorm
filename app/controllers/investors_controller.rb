class InvestorsController < ApplicationController

  def edit
    @investor = current_user.accountable
  end

  def update
    raise params.inspect
  end

  private

  def investor_params
    params.require(:investor).permit(:name, :location, :bio)
  end


end
