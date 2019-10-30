module InventorsHelper

  def inventor_edit_link
    if inventor_account == @inventor
      render "inventors/edit_button"
    end
  end
  
end
