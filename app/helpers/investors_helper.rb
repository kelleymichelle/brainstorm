module InvestorsHelper

  def investor_edit_link
    if investor_account == @investor
      render "investors/edit_button"
    end
  end

end
