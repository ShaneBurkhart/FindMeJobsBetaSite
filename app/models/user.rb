class User < ActiveRecord::Base
  attr_accessible :email, :account
  VALID_EMAIL_REGEX = /^[\w+\-.]+@[a-z\d\-.]+\.[a-z]+$/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
  	uniqueness: true
  validate :check_account

  def employer?
    self.account == "Employer"
  end

  def job_seeker?
    self.account == "Job Seeker"
  end

  private

  	def check_account
  		self.account = "Job Seeker" unless self.account == "Employer"
  	end

end
