class Inventor < ApplicationRecord
  include Accountable

  validates :name, presence: true
  validates :bio, length: { maximum: 500 }
  validates :location, presence: true 

  has_one :account, as: :accountable, dependent: :destroy
  has_many :ideas, dependent: :destroy
  has_many :groups, through: :ideas
  has_many :investors, through: :ideas
  has_many :comments, through: :ideas

end
