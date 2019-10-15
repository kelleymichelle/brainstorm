module AccountsHelper
  
  def error_msg_for(object, field)
    if object.errors[field].any?
        "<p class='error-text small-text'>#{object.errors[field].join("; ").capitalize}</p>"
    else
        ""
    end
end

end
