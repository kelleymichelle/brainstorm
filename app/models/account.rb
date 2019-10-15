class Account < ApplicationRecord

  has_secure_password

  validates :username, presence: true
  validates :password_confirmation, presence: true, on: :create
  # validates :password, if: :setting_password?
  validates :email, presence: true, length: { minimum: 5 }
  validates :email, uniqueness: { case_sensitive: false }
  # validate :email_must_be_valid

  belongs_to :accountable, :polymorphic => true
  
  # def self.is_inventor=(arg)
  #   self.inventor = arg
  # end

  # def selfis_investor=(arg)
  #   self.investor = arg
  # end

  # def inventor
  #   self.inventor
  # end

  # def investor
  #   self.investor
  # end

  # def email_must_be_valid
  #   errors.add(:email, "must be a  valid email address") unless email.include?(".") and email.include?("@")
  # end

  def setting_password?
    password || password_confirmation
  end

end
