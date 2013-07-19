class UserMailer < ActionMailer::Base
  default from: "newsletter@findme.jobs"

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to FindMe.Jobs Beta')
  end
end
