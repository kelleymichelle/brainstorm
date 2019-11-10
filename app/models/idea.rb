class Idea < ApplicationRecord
  belongs_to :inventor
  belongs_to :group
  has_many :comments, dependent: :destroy

  has_many :favorites
  has_many :investors, through: :favorites

  validates :title, presence: true
  validates :description, presence: true, length: { maximum: 1000 }
  validates :fund_goal, presence: true
  validates :group, presence: true

  scope :most_popular, ->(){joins(:favorites).group(:idea_id).order(Arel.sql('count(favorites.id) desc')).limit(1).first}

  def find_favorite(idea)
    @investor.ideas.where(id: self.id)
  end

  def favorite_count
    self.favorites.count
  end
  
end
