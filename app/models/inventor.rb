class Inventor < ApplicationRecord
  has_secure_password
  has_many :ideas
  has_many :groups through: :ideas
  has_many :investors through: :ideas

end
