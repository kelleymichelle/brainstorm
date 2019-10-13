class Idea < ApplicationRecord
  belongs_to :inventor
  belongs_to :group
  has_many :comments
end
