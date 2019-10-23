class Idea < ApplicationRecord
  belongs_to :inventor
  belongs_to :group
  has_many :comments, dependent: :destroy

  has_many :investors, through: :favorites

  validates :title, presence: true
  validates :description, presence: true, length: { maximum: 1000 }
  validates :fund_goal, presence: true
  validates :group, presence: true
  
end
