class UserMailer < ActionMailer::Base
  default from: "feedback@underjobs.me"

  def welcome_email(user)
    @count = User.count
    @employers_count = User.where(account: "Employer").count
    @job_seeker_count = User.where(account: "Job Seeker").count
    @user = user
    if @user.employer?
      template = "welcome_email_employer"
    else
      template = "welcome_email_job_seeker"
    end
    mail(to: "jobapp417@gmail.com", subject: "#{@user.email} - Another User Signed Up",
        template_name: "user_signed_up").deliver
    mail(to: @user.email, subject: 'Welcome to FindMe.Jobs Beta',
        template_name: template)
  end
end
