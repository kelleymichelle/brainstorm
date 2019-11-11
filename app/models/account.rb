class Account < ApplicationRecord

  has_secure_password

  validates :password, presence: true, if: :setting_password?
  validates :email, presence: true, length: { minimum: 5 }
  validates :email, uniqueness: { case_sensitive: false }
  validate :email_must_be_valid

  belongs_to :accountable, :polymorphic => true
  
  def self.find_or_create_by_omniauth(auth_hash)        
    account = self.find_or_create_by(:uid => auth_hash[:uid]) do |a|
        a.username = auth_hash[:info][:name]
        a.email = auth_hash[:info][:email]
        a.password = SecureRandom.hex 
    end
end

  def email_must_be_valid
    errors.add(:email, "must be a valid email address") unless email.include?(".") and email.include?("@")
  end

  def setting_password?
    password || password_confirmation
  end

end
