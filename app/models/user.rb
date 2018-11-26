class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}
  validates :username, uniqueness: true
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :password,
            length: {minimum: 6},
            confirmation: true,
            if: lambda{new_record? || !password.nil?}
end
