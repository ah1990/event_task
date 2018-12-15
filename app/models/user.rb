class User < ApplicationRecord
  has_secure_password
  before_save { self.email = email.downcase }

  validates :name, :surname, :password_digest, presence: true
  validates :email,  uniqueness: true, presence: true,
            format: { with: URI::MailTo::EMAIL_REGEXP,
                      message: 'only allows valid emails' }

  def full_name
    [name, surname].join(' ')
  end
end
