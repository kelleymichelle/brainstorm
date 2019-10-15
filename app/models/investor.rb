class Investor < ApplicationRecord

  validates :name, presence: true
  validates :bio, length { maximum: 500 }
  validates :location, presence: true 

  has_one :account, as: :accountable, dependent: :destroy
  has_many :inventors, through: :ideas
  has_many :ideas, through: :inventors

end
