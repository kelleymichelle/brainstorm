module ApplicationHelper
  #before_action :inventor_account
  #before_action :investor_account

  def dashboard_route
    if investor_account
      investor_path(current_user.accountable)
    else inventor_account
      inventor_path(current_user.accountable)
    end    
  end

  def render_navbar
    if logged_in?
      render "layouts/logged_in_navbar"
    else
      render "layouts/logged_out_navbar"
    end
  end

end
