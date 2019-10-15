class AccountsController < ApplicationController

  def new
    @account = Account.new
  end

  def create
    raise params.inspect
    # @user = User.new(new_user_params)
    # if @user.save
    #     log_in(@user)
    #     flash[:success] = "Welcome #{@user.name}!"
    #     redirect_to dashboard_path
    # else
    #     flash[:danger] = "Oops! There was trouble making your acount."
    #     render 'new'
    # end

  end

  private

  def account_params
    params.require(:account).permit(:username, :email, :password, :password_confirmation, :investor, :inventor)
  end

end
