module IdeasHelper

  
  def time_of_creation(idea)
    idea.created_at.strftime("%A, %b %e, at %l:%M %p")
  end

  def mail_link
    # byebug
    if current_user.accountable != @idea.inventor
      render "ideas/mail_to"
    end 
  end

  def edit_link
    if inventor_account == @idea.inventor
      render "ideas/edit_button"
    end  
  end
  
end
