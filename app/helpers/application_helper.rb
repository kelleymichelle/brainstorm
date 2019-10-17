module ApplicationHelper
  #before_action :inventor_account
  #before_action :investor_account

  def dashboard_route
    #determine which route to send which account based on accountable
    if investor_account
      investor_path(current_user.accountable)
    else inventor_account
      inventor_path(current_user.accountable)
    end    
  end

  # def time_of_creation(idea)
  #   idea.created_at.strftime("Brainstormed at %A, %b %e, at %l:%M %p")
  # end
  


end
