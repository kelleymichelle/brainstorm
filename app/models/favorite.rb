class Favorite < ApplicationRecord
  belongs_to :investor
  belongs_to :idea
  # has_many :investors

  validates :investor_id, uniqueness: { scope: :idea_id }

  def note=(notes)
    self[:notes] = notes
  end

  # def note
  #   self.notes
  # end


end
