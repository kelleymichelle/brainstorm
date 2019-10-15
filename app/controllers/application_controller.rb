class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    Inventor.find_by(id: session[:inventor_id]) || Investor.find_by(id: session[:investor_id])
end

end
