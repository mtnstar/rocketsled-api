class User < ActiveRecord::Base
  has_secure_password

  validates_uniqueness_of :email

  validates :first_name, :email, :password_digest, presence: true

  has_one :api_key
end
