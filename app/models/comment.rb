class Comment < ApplicationRecord
  belongs_to :idea
  belongs_to :inventor

  validates :text, presence: true
  
end
