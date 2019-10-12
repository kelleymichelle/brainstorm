class Investor < ApplicationRecord
  has_secure_password
  has_many :inventors through: :ideas
  has_many :ideas through: :inventors
end
