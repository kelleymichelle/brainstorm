class Investor < ApplicationRecord
  include Accountable

  validates :name, presence: true
  validates :bio, length: { maximum: 500 }
  validates :location, presence: true 

  has_one :account, as: :accountable, dependent: :destroy
  has_many :inventors, through: :ideas
  has_many :favorites
  has_many :ideas, through: :favorites
  # has_many :favorites, through: :ideas, dependent: :destroy

  def favorite!(idea)
    # byebug
    self.favorites.build(idea_id: idea.id).save
  end

  # def unfavorite!(user)
  #   fav = user.favorites.find_by_idea_id(idea.id)
  #   fav.destroy!
  # end

  def favorite?(idea)
    self.favorites.find_by_idea_id(idea.id)
  end

end
