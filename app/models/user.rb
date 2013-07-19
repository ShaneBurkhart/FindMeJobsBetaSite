class User < ActiveRecord::Base
  attr_accessible :email
  VALID_EMAIL_REGEX = /^[\w+\-.]+@[a-z\d\-.]+\.[a-z]+$/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
  	uniqueness: true

end
