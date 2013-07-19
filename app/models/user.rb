class User < ActiveRecord::Base
  attr_accessible :email
  VALID_EMAIL_REGEX = /^\S+@\S+\.\S+$/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
  	uniqueness: true

end
