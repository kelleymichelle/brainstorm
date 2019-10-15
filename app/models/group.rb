class Group < ApplicationRecord
  has_many :ideas
  has_many :inventors, through: :ideas
end
