class UserMailer < ActionMailer::Base
  default from: "feedback@underjobs.me"

  def welcome_email(user)
    @user = user
    if @user.employer?
      template = "welcome_email_employer"
    else
      template = "welcome_email_job_seeker"
    end
    mail(to: @user.email, subject: 'Welcome to FindMe.Jobs Beta',
        template_name: template)
  end
end
