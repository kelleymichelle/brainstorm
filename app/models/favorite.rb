class Favorite < ApplicationRecord
  belongs_to :investor
  belongs_to :idea
  # has_many :investors

  validates :investor_id, uniqueness: { scope: :idea_id }



end
