module IdeasHelper

  
  def time_of_creation(idea)
    idea.created_at.strftime("%A, %b %e, at %l:%M %p")
  end
  
end
