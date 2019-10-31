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


  def find_favorite(idea)
    @investor.ideas.where(id: self.id)
  end

  def self.most_popular
    i = Idea.all.sort_by{|idea| idea.favorite_count}.map(&:id).last
    Idea.find_by_id(i)
  end

  def favorite_count
    self.favorites.count
  end
  
end
