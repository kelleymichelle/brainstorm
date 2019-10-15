class Account < ApplicationRecord
  has_secure_password

  validates :username, presence: true
  validates :password_confirmation, presence: true, on: :create
  validates :email, presence: true, length: { minimum: 5 }
  validates :email, uniqueness: { case_sensitive: false }
  validate :email_must_be_valid

  belongs_to :accountable
  

  def email_must_be_valid
    errors.add(:email, "must be valid") unless email.include?(".") and email.include?("@")
  end

end
